module ApplicationHelper
  # def webfonts_link_tag
  #   stylesheet_link_tag("https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap")
  # end

  def admin_webfonts_link_tag
    stylesheet_link_tag("https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap")
  end

  def admin_full_brand
    [
      t("admin.brand.title"),
      t("admin.brand.subtitle")
    ].join(" – ")
  end
end
