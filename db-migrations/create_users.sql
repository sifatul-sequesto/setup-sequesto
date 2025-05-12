INSERT INTO public.users (
	id, first_name, last_name, email, i_agree_to_terms, role_id, created_at, updated_at,
	deleted_at, blocked_at, status_id, last_login, profile_color, profile_image, settings
) VALUES (
	'ef61e24a-3e2f-47c9-9e38-b71d8a9f992b',
	'Sifatul',
	'Rabbi',
	'sifatul.rabbi+localtest@sequesto.com',
	true,
	1,
	'2024-10-01 11:11:46.376672+02',
	'2025-03-26 09:06:59.594+01',
	NULL,
	NULL,
	2,
	'2024-10-01 11:11:46.376672+02',
	'#0077FF',
	NULL,
	'{"influence": ""}'
);


INSERT INTO public.companies (
	id, name, description, website, line1, line2, city, state, postcode, country,
	created_at, updated_at, deleted_at, creator_id, modifier_id, num_coordinators, num_contributors
) VALUES (
	'd6b8d1d4-095c-4cfc-902f-546b3af99716',
	'Sifatul''s Org',
	'Software Development Firm',
	'https://sifatulrabbi.com',
	'Chondrima Housing, Mohammadpur',
	NULL,
	'Dhaka',
	'Dhaka',
	'1205',
	'Dhaka',
	'2024-10-01 11:11:46.376672+02',
	'2024-10-01 11:11:46.376672+02',
	NULL,
	'ef61e24a-3e2f-47c9-9e38-b71d8a9f992b',
	NULL,
	10,
	15
);


INSERT INTO public.companies_use_cases (
	id, company_id, use_case_id, updated_at, created_at, deleted_at
) VALUES
(
	'4239ba9c-b4e9-4e33-93d6-b621e7b1754d',
	'd6b8d1d4-095c-4cfc-902f-546b3af99716',
	2,
	'2024-10-01 11:11:46.376672+02',
	'2024-10-01 11:11:46.376672+02',
	NULL
),
(
	'727e6b46-f80d-48f1-adb7-8f009c505532',
	'd6b8d1d4-095c-4cfc-902f-546b3af99716',
	3,
	'2024-10-01 11:11:46.376672+02',
	'2024-10-01 11:11:46.376672+02',
	NULL
);


INSERT INTO public.members (
id, company_id, user_id, created_at, updated_at, deleted_at, creator_id, modifier_id, invited_at
) VALUES (
	'1fde5265-32d9-431d-9f35-66b6c125f399',
	'd6b8d1d4-095c-4cfc-902f-546b3af99716',
	'ef61e24a-3e2f-47c9-9e38-b71d8a9f992b',
	'2024-10-01 11:11:46.376672+02',
	'2024-10-01 11:11:46.376672+02',
	NULL,
	'ef61e24a-3e2f-47c9-9e38-b71d8a9f992b',
	'ef61e24a-3e2f-47c9-9e38-b71d8a9f992b',
	'2024-11-19 12:49:37+01'
);
