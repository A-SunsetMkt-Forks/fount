import { plugin } from 'bun'

plugin({
	name: 'deno npm: imports',
	setup(build) {
		// npm:xxx -> xxx
		build.onResolve(
			{ filter: /.*/, namespace: 'npm' },
			(args) => ({ path: args.path })
		)
		// https://deno.land/x/canvas/mod.ts -> canvas
		build.onResolve(
			{ filter: /\/\/deno\.land\/x\/(.+?)\//, namespace: 'https' },
			(args) => {
				const path = args.path.replace('//deno.land/x/', '').split('/')[0]
				return { path }
			}
		)
	},
})
