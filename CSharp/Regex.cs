using System.Text.RegularExpressions; public static class Quine { public static string Replicate() { var it = "using System.Text.RegularExpressions; public static class Quine { public static string Replicate() { var it = \"itself\"; return new Regex(\"itself\").Replace(it, it.Replace(\"\\\\\", \"\\\\\\\\\").Replace(\"\\\"\", \"\\\\\\\"\"), 1); } }"; return new Regex("itself").Replace(it, it.Replace("\\", "\\\\").Replace("\"", "\\\""), 1); } }