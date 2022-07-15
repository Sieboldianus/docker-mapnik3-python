# docker-mapnik3-python

A Dockerfile that adds python-bindings to [jawg/docker-mapnik3](https://github.com/jawg/docker-mapnik3).
The image uses Python 3.

## Build

```
git clone git@github.com:Sieboldianus/docker-mapnik3-python.git
cd docker-mapnik3-python
docker build --tag mapnik3_python .
```

## Run

Test:
```
docker run --rm \
    mapnik3_python \
    /bin/bash -c "mapnik-config -v"
```
> 3.0.24

With mounted data:
```
cd ~/myproject/
docker run --rm \
    --volume $(pwd)/data-test:/data-test \
    --volume ~/.fonts:/fonts \
    --volume $(pwd)/styles:/styles \
    --volume $(pwd)/output:/output \
    mapnik3_python \
    /bin/bash -c "python3 /styles/style_xml.py"
```

Test styles for the example above:

<details><summary><code>style.xml</code></summary>

```xml
<?xml version="1.0" encoding="utf-8"?>

<Map background-color="#ffffff">
    <Parameters>
        <Parameter name="sizes">256, 256</Parameter>
        <Parameter name="bbox">-1, -1, 1, 1</Parameter>
    </Parameters>
    <FontSet name="fontset">
        <Font face-name="Segoe UI Emoji Regular" />
		<Font face-name="Noto Sans Regular" />
		<Font face-name="Noto Sans CJK JP Regular" />
		<Font face-name="Noto Sans Adlam Regular" />
		<Font face-name="Noto Sans Adlam Unjoined Regular" />
		<Font face-name="Noto Sans Bamum Regular" />
		<Font face-name="Noto Sans Batak Regular" />
		<Font face-name="Noto Sans Bengali UI Regular" />
		<Font face-name="Noto Sans Buginese Regular" />
		<Font face-name="Noto Sans Buhid Regular" />
		<Font face-name="Noto Sans Canadian Aboriginal Regular" />
		<Font face-name="Noto Sans Chakma Regular" />
		<Font face-name="Noto Sans Cham Regular" />
		<Font face-name="Noto Sans Cherokee Regular" />
		<Font face-name="Noto Sans Coptic Regular" />
		<Font face-name="Noto Sans Devanagari UI Regular" />
		<Font face-name="Noto Sans Ethiopic Regular" />
		<Font face-name="Noto Sans Georgian Regular" />
		<Font face-name="Noto Sans Gujarati UI Regular" />
		<Font face-name="Noto Sans Gurmukhi UI Regular" />
		<Font face-name="Noto Sans Hanunoo Regular" />
		<Font face-name="Noto Sans Hebrew Regular" />
		<Font face-name="Noto Sans Javanese Regular" />
		<Font face-name="Noto Sans Kannada UI Regular" />
		<Font face-name="Noto Sans Kayah Li Regular" />
		<Font face-name="Noto Sans Khmer UI Regular" />
		<Font face-name="Noto Sans Lao UI Regular" />
		<Font face-name="Noto Sans Lepcha Regular" />
		<Font face-name="Noto Sans Limbu Regular" />
		<Font face-name="Noto Sans Lisu Regular" />
		<Font face-name="Noto Sans Malayalam UI Regular" />
		<Font face-name="Noto Sans Mandaic Regular" />
		<Font face-name="Noto Sans Mongolian Regular" />
		<Font face-name="Noto Sans Myanmar UI Regular" />
		<Font face-name="Noto Sans New Tai Lue Regular" />
		<Font face-name="Noto Sans NKo Regular" />
		<Font face-name="Noto Sans Ol Chiki Regular" />
		<Font face-name="Noto Sans Oriya UI Regular" />
		<Font face-name="Noto Sans Osage Regular" />
		<Font face-name="Noto Sans Osmanya Regular" />
		<Font face-name="Noto Sans Samaritan Regular" />
		<Font face-name="Noto Sans Saurashtra Regular" />
		<Font face-name="Noto Sans Shavian Regular" />
		<Font face-name="Noto Sans Sinhala UI Regular" />
		<Font face-name="Noto Sans Sinhala Regular" />
		<Font face-name="Noto Sans Sundanese Regular" />
		<Font face-name="Noto Sans Symbols Regular" />
		<Font face-name="Noto Sans Symbols2 Regular" />
		<Font face-name="Noto Sans Tagalog Regular" />
		<Font face-name="Noto Sans Tagbanwa Regular" />
		<Font face-name="Noto Sans Tai Le Regular" />
		<Font face-name="Noto Sans Tai Tham Regular" />
		<Font face-name="Noto Sans Tai Viet Regular" />
		<Font face-name="Noto Sans Tamil UI Regular" />
		<Font face-name="Noto Sans Telugu UI Regular" />
		<Font face-name="Noto Sans Thaana Regular" />
		<Font face-name="Noto Sans Thai UI Regular" />
		<Font face-name="Noto Sans Tibetan Regular" />
		<Font face-name="Noto Sans Tifinagh Regular" />
		<Font face-name="Noto Sans Vai Regular" />
		<Font face-name="Noto Sans Yi Regular" />
		<Font face-name="Noto Sans Arabic UI Regular" />
		<Font face-name="Noto Emoji Regular" />
		<Font face-name="Noto Naskh Arabic UI Regular" />
		<Font face-name="DejaVu Sans Book" />
		<Font face-name="HanaMinA Regular" />
		<Font face-name="HanaMinB Regular" />
		<Font face-name="Unifont Medium" />
		<Font face-name="Unifont Upper Medium" />
    </FontSet>
    <Style name="example-text">
        <Rule>
            <TextSymbolizer
                placement="point"
                size="30"
                fontset-name="fontset"
                fill="#000000"
                justify-alignment="center"
                >
                [text]
            </TextSymbolizer>
        </Rule>
    </Style>
    <Layer name="example-text">
        <StyleName>example-text</StyleName>
        <Datasource>
            <Parameter name="type">csv</Parameter>
            <Parameter name="inline">
id|wkt|text
1|Point(0 0)|🌸
2|Point(1 0)|🍺
3|Point(0 1)|📚
4|Point(1 1)|📸
5|Point(0 -1)|📸
6|Point(-1 0)|🍸
7|Point(-1 -1)|💥
8|Point(-1 1)|🎸
9|Point(1 -1)|🚙
            </Parameter>
        </Datasource>
    </Layer>
</Map>
```

</details>

<details><summary><code>style_test_xml.py</code></summary>

```python
#!/usr/bin/env python3

import mapnik

mapnik.register_fonts('/fonts/')
# for face in mapnik.FontEngine.face_names(): print(face)

stylesheet = '/styles/style.xml'
image = '/output/test_style.png'
m = mapnik.Map(2500,1400)
mapnik.load_map(m, stylesheet)
m.zoom_all() 
mapnik.render_to_file(m, image)
```

</details>