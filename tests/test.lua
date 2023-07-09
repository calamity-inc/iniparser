local ini <const> = dofile("../iniparser.lua")

-- Ensure that everything works fine in a locale that uses ',' as decimal separator
do
	os.setlocale("fr-FR.UTF-8")

	local res = ini.parse("usave.ini")
	assert(res.section.myInt == 42)
	assert(res.section.myFloat == 1.23)
	res.save("usave.ini")
	res = ini.parse("usave.ini")
	assert(res.section.myInt == 42)
	assert(res.section.myFloat == 1.23)
end
