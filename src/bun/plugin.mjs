import { plugin } from 'bun'
import { execSync } from 'node:child_process'

function install(pkgname) {
	execSync(`bun install ${pkgname}`)
}

plugin({
	name: 'deno npm: imports',
	setup(build) {
		// npm:xxx -> xxx
		build.onResolve(
			{ filter: /.*/, namespace: 'npm' },
			(args) => {
				install(args.path)
				return {path: args.path }
			}
		)
		// https://deno.land/x/canvas/mod.ts -> canvas
		build.onResolve(
			{ filter: /\/\/deno\.land\/x\/(.+?)\//, namespace: 'https' },
			(args) => {
				const path = args.path.replace('//deno.land/x/', '').split('/')[0]
				install(path)
				return { path }
			}
		)
	},
})
