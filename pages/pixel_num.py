fonts = []
fonts.append(
    """111
101
111
101
111
"""
)
fonts.append(
    """001
001
001
001
001
"""
)
fonts.append(
    """111
001
111
100
111
"""
)
fonts.append(
    """111
001
111
001
111
"""
)
fonts.append(
    """101
101
111
001
001
"""
)
fonts.append(
    """111
100
111
001
111
"""
)
fonts.append(
    """111
100
111
101
111
"""
)
fonts.append(
    """111
001
001
001
001
"""
)
fonts.append(
    """111
101
111
101
111
"""
)
fonts.append(
    """111
101
111
001
111
"""
)
fonts.append(
    """111
101
111
101
101
"""
)
fonts.append(
    """100
100
111
101
111
"""
)

fonts.append(
    """111
100
100
100
111
"""
)
fonts.append(
    """001
001
111
101
111
"""
)
fonts.append(
    """111
100
111
100
111
"""
)
fonts.append(
    """111
100
111
100
100
"""
)
width = 1
length = 2
print(fonts)
print(len(fonts))
for i in range(16):
    for j in range(width):
        print(f"num_font[4'h{i:x}][{j}] = {(width + length + width)}'b{fonts[i][0] * width + fonts[i][1] * length + fonts[i][2] * width}")
        
    for j in range(width, width + length):
        print(f"num_font[4'h{i:x}][{j}] = {(width + length + width)}'b{fonts[i][4] * width + fonts[i][5] * length + fonts[i][6] * width}")
        
    for j in range(width + length, width + length + width):
        print(f"num_font[4'h{i:x}][{j}] = {(width + length + width)}'b{fonts[i][8] * width + fonts[i][9] * length + fonts[i][10] * width}")

    for j in range(width + length + width, width + length + width + length):
        print(f"num_font[4'h{i:x}][{j}] = {(width + length + width)}'b{fonts[i][12] * width + fonts[i][13] * length + fonts[i][14] * width}")

        
    for j in range(width + length + width + length, width + length + width + length + width):
        print(f"num_font[4'h{i:x}][{j}] = {(width + length + width)}'b{fonts[i][16] * width + fonts[i][17] * length + fonts[i][18] * width}")
    print("")