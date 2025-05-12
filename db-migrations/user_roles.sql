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

INSERT INTO public.users_roles (
	id, name, description, enabled, created_at, updated_at, deleted_at
) VALUES
(1, 'Admin', NULL, true, '2024-10-01 11:11:38.175255+02', '2024-10-01 11:11:38.175255+02', NULL),
(2, 'Coordinator', NULL, true, '2024-10-01 11:11:38.175255+02', '2024-10-01 11:11:38.175255+02', NULL),
(3, 'Contributor', NULL, true, '2024-10-01 11:11:38.175255+02', '2024-10-01 11:11:38.175255+02', NULL),
(4, 'SuperAdmin', NULL, true, '2024-11-14 13:16:57.931077+01', '2024-11-14 13:16:57.931077+01', NULL);
