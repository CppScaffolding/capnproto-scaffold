-- scaffold geniefile for capnproto

capnproto_script = path.getabsolute(path.getdirectory(_SCRIPT))
capnproto_root = path.join(capnproto_script, "capnproto")

capnproto_includedirs = {
	path.join(capnproto_script, "config"),
	capnproto_root,
}

capnproto_libdirs = {}
capnproto_links = {}
capnproto_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { capnproto_includedirs }
	end,

	_add_defines = function()
		defines { capnproto_defines }
	end,

	_add_libdirs = function()
		libdirs { capnproto_libdirs }
	end,

	_add_external_links = function()
		links { capnproto_links }
	end,

	_add_self_links = function()
		links { "capnproto" }
	end,

	_create_projects = function()

project "capnproto"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		capnproto_includedirs,
	}

	defines {}

	files {
		path.join(capnproto_script, "config", "**.h"),
		path.join(capnproto_root, "**.h"),
		path.join(capnproto_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
