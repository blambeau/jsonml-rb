module JsonML

  def self.to_html_text(src, out = "")
    has_attrs   = src[1].is_a?(Hash)
    first_child = has_attrs ? 2 : 1

    case src
    when Array
      out << "<#{src.first}"
      out << " " << attrs2html(src[1]) if has_attrs
      out << ">"
      src[first_child..-1].each{|child| to_html_text(child, out) }
      out << "</#{src.first}>"
    when String
      out << src
    else
      raise "Unexpected node `#{src}`"
    end
  end

  def self.attrs2html(attrs)
    attrs.each_pair.map{|pair| attr2html(*pair) }.join(" ")
  end

  def self.attr2html(key, value)
    %Q{#{key}="#{value}"}
  end

end
require "jsonml/version"
