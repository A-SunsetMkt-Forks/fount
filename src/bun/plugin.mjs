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
			{ filter: /https:\/\/deno\.land\/x\/(.+?)\// },
			(args) => {
				const path = args.path.replace('https://deno.land/x/', '').split('/')[0]
				return { path }
			}
		)
	},
})
