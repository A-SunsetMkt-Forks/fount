import { plugin } from 'bun'

plugin({
	name: 'deno npm: imports',
	setup(build) {
		build.onResolve(
			{ filter: /.*/, namespace: 'npm' },
			(args) => ({ path: args.path })
		)
	},
})
