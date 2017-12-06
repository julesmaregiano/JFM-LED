Chartkick.options = {
  height: "400px",
  colors: [$anis, $gray]
}
Chartkick.options[:html] = '<div id="%{id}" style="height: %{height};">Loading...</div>'
Chartkick.options[:content_for] = :charts_js
