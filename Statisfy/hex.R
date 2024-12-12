library(dplyr)
library(magick)
library(hexSticker)

img <- image_read("C:/Users/daria/Downloads/xenakiswebsite3-1.jpg")
res <- img %>%
  image_convert("png") %>%
  image_resize("2000 x 200")%>%
  image_fill(color="#062047", point="+45")

res


# wrap in plot to preview ie plot(sticker(...))
final_res <- sticker(res, package="statisfy", p_size=30,
                   p_y = 0.7,
                   s_x=1, s_y=1, s_width=1.3,
                   s_height = 20,
                   filename="man/figures/Statisfy_hex.png",h_fill="maroon",h_color = "#062047")

plot(final_res)
