#!/usr/bin/env -S jq --args -erf

# ["number", "boolean", "array", "object", "null", "string"]

def should_colour: $ARGS.positional[0] == "C";

def pad(indent): " " * indent;

def format(indent; needs_new_line):
  if needs_new_line then "\n" + pad(indent) else "" end + join("\n" + pad(indent));

def normal: "0";
def bright: "1";
def bold: bright;

def white: "37";
def blue: "34";
def green: "32";
def grey: "90";

def ansi(spec; code): "\u001b[" + spec + ";" + code + "m";

def color(spec; color): if should_colour == false then . else
  ansi(spec; color) + . + ansi(normal; white)
end;

def color(color): color(normal; color);

def to_yaml(indent; inobj):
  if type == "object" then [to_entries.[] |
    (.key | color(bold; blue)) + (": " | color(bold; white)) + (.value | to_yaml(indent + 2; true))
  ] | format(indent; inobj)
  elif type == "array" then [.[] |
    "- " + to_yaml(indent + if inobj then 0 else 2 end; false)
  ] | format(if inobj then indent - 2 else indent end; inobj)
  elif type == "null" then "~" | color(grey)
  elif type == "string" and contains("\n") then "|" + (split("\n") | format(indent; true))
  elif type == "string" then tojson | color(green)
  else tojson end;

def to_yaml: to_yaml(0; false);

to_yaml + "\n---\n"
