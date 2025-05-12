CREATE TABLE IF NOT EXISTS public.users_roles
(
	id integer NOT NULL,
	name character varying(255) COLLATE pg_catalog."default" NOT NULL,
	description text COLLATE pg_catalog."default",
	enabled boolean NOT NULL DEFAULT true,
	created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
	updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
	deleted_at timestamp with time zone,
	CONSTRAINT users_roles_pkey PRIMARY KEY (id)
);

INSERT INTO public.folders_status (
	id, name, description, enabled, created_at, updated_at, deleted_at
) VALUES
(1, 'New', NULL, true, '2024-11-19 07:49:26.79782+01', '2024-11-19 07:49:26.79782+01', NULL),
(2, 'In progress', NULL, true, '2024-10-01 11:11:38.173943+02', '2024-10-01 11:11:38.173943+02', NULL),
(3, 'On hold', NULL, true, '2024-10-01 11:11:38.173943+02', '2024-10-01 11:11:38.173943+02', NULL),
(4, 'Completed', NULL, true, '2024-10-01 11:11:38.173943+02', '2024-10-01 11:11:38.173943+02', NULL),
(5, 'Cancelled', NULL, true, '2024-10-01 11:11:38.173943+02', '2024-10-01 11:11:38.173943+02', NULL),
(6, 'Archived', NULL, true, '2024-10-01 11:11:38.173943+02', '2024-10-01 11:11:38.173943+02', NULL);
