#import "templates/billryan/template.typ": *

// Read configuration
#let metadata = toml("./metadata.toml")

// Support CLI language override: typst compile --input language=zh cv-billryan.typ
#let cv-language = sys.inputs.at("language", default: metadata.language)

// Build display name
#let display-name = if cv-language == "zh" {
  metadata.lang.non_latin.name
} else {
  metadata.personal.first_name + " " + metadata.personal.last_name
}

// Build contact info from metadata.toml [personal.info]
#let personal = metadata.personal.info
#let contact-info = {
  let items = ()
  if "email" in personal {
    items.push(("envelope.svg", personal.email, "mailto:" + personal.email))
  }
  if "phone" in personal {
    items.push(("square-phone.svg", personal.phone, none))
  }
  if "github" in personal {
    items.push(("github.svg", personal.github, "https://github.com/" + personal.github))
  }
  if "linkedin" in personal {
    items.push(("linkedin.svg", personal.linkedin, "https://linkedin.com/in/" + personal.linkedin))
  }
  // WeChat (custom-1)
  if "custom-1" in personal {
    items.push(("wechat.svg", personal.custom-1.text, none))
  }
  if "location" in personal {
    items.push(("location.svg", personal.location, none))
  }
  items
}

// Apply template
#show: doc => conf(
  name: display-name,
  info: contact-info,
  lang: cv-language,
  body: doc,
)

// Module import helper
#let import-modules(modules, lang: cv-language) = {
  for module in modules {
    include { "modules_billryan_" + lang + "/" + module + ".typ" }
  }
}

// Module load order — /generate-resume can adjust this array
#import-modules(("professional", "skills", "projects", "education", "certificates"))
