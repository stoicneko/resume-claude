#import "@preview/brilliant-cv:3.2.0": cv

// Read configuration
#let metadata = toml("./metadata.toml")

// Support CLI language override: typst compile --input language=zh cv.typ
#let cv-language = sys.inputs.at("language", default: none)
#let metadata = if cv-language != none {
  metadata + (language: cv-language)
} else {
  metadata
}

// Module import helper
#let import-modules(modules, lang: metadata.language) = {
  for module in modules {
    include { "modules_" + lang + "/" + module + ".typ" }
  }
}

// Apply CV template
#show: cv.with(metadata)

// Module load order — /generate-resume can adjust this array
#import-modules(("professional", "skills", "projects", "education", "certificates"))
