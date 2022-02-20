library(pagedown)

browser_path <- "C:/Program Files/Google/Chrome/Application/chrome.exe"

chrome_print(input = "https://sociology-fa-cu.github.io/statistika1/slides/intro.html#1", 
             output = xfun::with_ext("C:/rwd_main/statistika1/slides_pdf", "pdf"), 
             browser = browser_path, 
             extra_args = c("--disable-gpu"), verbose = FALSE)
