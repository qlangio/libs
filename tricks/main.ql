Fntable = class {
	fn _init(tbl) {
		this.tbl = tbl
	}

	fn inject(tbl) {
		for name, method = range tbl {
			this.tbl[name] = method
		}
	}

	fn inherit(Base) {
		tbl = reflect.valueOf(Base).elem().fieldByName("Fns").interface()
		for name, method = range tbl {
			if this.tbl[name] == undefined {
				this.tbl[name] = method
			}
		}
	}
}

of = fn(Class) {
	return new Fntable(reflect.valueOf(Class).elem().fieldByName("Fns").interface())
}

inject = fn(Class, tbl) {
	of(Class).inject(tbl)
}

inherit = fn(Class, Base) {
	of(Class).inherit(Base)
}

export of, inject, inherit
