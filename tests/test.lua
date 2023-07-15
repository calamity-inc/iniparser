local ini = dofile("../iniparser.lua")

-- Ensure that everything works fine in a locale that uses ',' as decimal separator
do
	os.setlocale("fr-FR.UTF-8")

	local res = ini.parse("usave.ini")
	assert(res.section.myInt == 42)
	assert(res.section.myFloat == 1.23)
	assert(res.section.myStr == "Hello, world!")
	res.save("usave.ini")
	res = ini.parse("usave.ini")
	assert(res.section.myInt == 42)
	assert(res.section.myFloat == 1.23)
	assert(res.section.myStr == "Hello, world!")
end

-- Test commaCompat
do
	local res = ini.parse("commaCompat.ini")
	assert(res.section.myInt == 42)
	assert(res.section.myFloat == "1,23")
	assert(res.section.myStr == "Hello, world!")
	res = ini.parse("commaCompat.ini", { commaCompat = true })
	assert(res.section.myInt == 42)
	assert(res.section.myFloat == 1.23)
	assert(res.section.myStr == "Hello, world!")
end
