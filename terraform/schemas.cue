package terraform

format_version: "1.0"
provider_schemas: "registry.opentofu.org/integrations/github": {
	provider: {
		version: 0
		block: {
			attributes: {
				base_url: {
					type:             "string"
					description:      "The GitHub Base API URL"
					description_kind: "plain"
					optional:         true
				}
				insecure: {
					type:             "bool"
					description:      "Enable `insecure` mode for testing purposes"
					description_kind: "plain"
					optional:         true
				}
				max_retries: {
					type:             "number"
					description:      "Number of times to retry a request after receiving an error status codeDefaults to 3"
					description_kind: "plain"
					optional:         true
				}
				organization: {
					type:             "string"
					description:      "The GitHub organization name to manage. Use this field instead of `owner` when managing organization accounts."
					description_kind: "plain"
					deprecated:       true
					optional:         true
				}
				owner: {
					type:             "string"
					description:      "The GitHub owner name to manage. Use this field instead of `organization` when managing individual accounts."
					description_kind: "plain"
					optional:         true
				}
				parallel_requests: {
					type:             "bool"
					description:      "Allow the provider to make parallel API calls to GitHub. You may want to set it to true when you have a private Github Enterprise without strict rate limits. Although, it is not possible to enable this setting on github.com because we enforce the respect of github.com's best practices to avoid hitting abuse rate limitsDefaults to false if not set"
					description_kind: "plain"
					optional:         true
				}
				read_delay_ms: {
					type:             "number"
					description:      "Amount of time in milliseconds to sleep in between non-write requests to GitHub API. Defaults to 0ms if not set."
					description_kind: "plain"
					optional:         true
				}
				retry_delay_ms: {
					type:             "number"
					description:      "Amount of time in milliseconds to sleep in between requests to GitHub API after an error response. Defaults to 1000ms or 1s if not set, the max_retries must be set to greater than zero."
					description_kind: "plain"
					optional:         true
				}
				retryable_errors: {
					type: ["list", "number"]
					description:      "Allow the provider to retry after receiving an error status code, the max_retries should be set for this to workDefaults to [500, 502, 503, 504]"
					description_kind: "plain"
					optional:         true
				}
				token: {
					type:             "string"
					description:      "The OAuth token used to connect to GitHub. Anonymous mode is enabled if both `token` and `app_auth` are not set."
					description_kind: "plain"
					optional:         true
				}
				write_delay_ms: {
					type:             "number"
					description:      "Amount of time in milliseconds to sleep in between writes to GitHub API. Defaults to 1000ms or 1s if not set."
					description_kind: "plain"
					optional:         true
				}
			}
			block_types: app_auth: {
				nesting_mode: "list"
				block: {
					attributes: {
						id: {
							type:             "string"
							description:      "The GitHub App ID."
							description_kind: "plain"
							required:         true
						}
						installation_id: {
							type:             "string"
							description:      "The GitHub App installation instance ID."
							description_kind: "plain"
							required:         true
						}
						pem_file: {
							type:             "string"
							description:      "The GitHub App PEM file contents."
							description_kind: "plain"
							required:         true
							sensitive:        true
						}
					}
					description:      "The GitHub App credentials used to connect to GitHub. Conflicts with `token`. Anonymous mode is enabled if both `token` and `app_auth` are not set."
					description_kind: "plain"
				}
				max_items: 1
			}
			description_kind: "plain"
		}
	}
	resource_schemas: {
		github_actions_environment_secret: {
			version: 0
			block: {
				attributes: {
					created_at: {
						type:             "string"
						description:      "Date of 'actions_environment_secret' creation."
						description_kind: "plain"
						computed:         true
					}
					encrypted_value: {
						type:             "string"
						description:      "Encrypted value of the secret using the GitHub public key in Base64 format."
						description_kind: "plain"
						optional:         true
						sensitive:        true
					}
					environment: {
						type:             "string"
						description:      "Name of the environment."
						description_kind: "plain"
						required:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					plaintext_value: {
						type:             "string"
						description:      "Plaintext value of the secret to be encrypted."
						description_kind: "plain"
						optional:         true
						sensitive:        true
					}
					repository: {
						type:             "string"
						description:      "Name of the repository."
						description_kind: "plain"
						required:         true
					}
					secret_name: {
						type:             "string"
						description:      "Name of the secret."
						description_kind: "plain"
						required:         true
					}
					updated_at: {
						type:             "string"
						description:      "Date of 'actions_environment_secret' update."
						description_kind: "plain"
						computed:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_actions_environment_variable: {
			version: 0
			block: {
				attributes: {
					created_at: {
						type:             "string"
						description:      "Date of 'actions_variable' creation."
						description_kind: "plain"
						computed:         true
					}
					environment: {
						type:             "string"
						description:      "Name of the environment."
						description_kind: "plain"
						required:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					repository: {
						type:             "string"
						description:      "Name of the repository."
						description_kind: "plain"
						required:         true
					}
					updated_at: {
						type:             "string"
						description:      "Date of 'actions_variable' update."
						description_kind: "plain"
						computed:         true
					}
					value: {
						type:             "string"
						description:      "Value of the variable."
						description_kind: "plain"
						required:         true
					}
					variable_name: {
						type:             "string"
						description:      "Name of the variable."
						description_kind: "plain"
						required:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_actions_organization_oidc_subject_claim_customization_template: {
			version: 0
			block: {
				attributes: {
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					include_claim_keys: {
						type: ["list", "string"]
						description:      "A list of OpenID Connect claims."
						description_kind: "plain"
						required:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_actions_organization_permissions: {
			version: 0
			block: {
				attributes: {
					allowed_actions: {
						type:             "string"
						description:      "The permissions policy that controls the actions that are allowed to run. Can be one of: 'all', 'local_only', or 'selected'."
						description_kind: "plain"
						optional:         true
					}
					enabled_repositories: {
						type:             "string"
						description:      "The policy that controls the repositories in the organization that are allowed to run GitHub Actions. Can be one of: 'all', 'none', or 'selected'."
						description_kind: "plain"
						required:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
				}
				block_types: {
					allowed_actions_config: {
						nesting_mode: "list"
						block: {
							attributes: {
								github_owned_allowed: {
									type:             "bool"
									description:      "Whether GitHub-owned actions are allowed in the organization."
									description_kind: "plain"
									required:         true
								}
								patterns_allowed: {
									type: ["set", "string"]
									description:      "Specifies a list of string-matching patterns to allow specific action(s). Wildcards, tags, and SHAs are allowed. For example, 'monalisa/octocat@', 'monalisa/octocat@v2', 'monalisa/'."
									description_kind: "plain"
									optional:         true
								}
								verified_allowed: {
									type:             "bool"
									description:      "Whether actions in GitHub Marketplace from verified creators are allowed. Set to 'true' to allow all GitHub Marketplace actions by verified creators."
									description_kind: "plain"
									optional:         true
								}
							}
							description:      "Sets the actions that are allowed in an organization. Only available when 'allowed_actions' = 'selected'"
							description_kind: "plain"
						}
						max_items: 1
					}
					enabled_repositories_config: {
						nesting_mode: "list"
						block: {
							attributes: repository_ids: {
								type: ["set", "number"]
								description:      "List of repository IDs to enable for GitHub Actions."
								description_kind: "plain"
								required:         true
							}
							description:      "Sets the list of selected repositories that are enabled for GitHub Actions in an organization. Only available when 'enabled_repositories' = 'selected'."
							description_kind: "plain"
						}
						max_items: 1
					}
				}
				description_kind: "plain"
			}
		}
		github_actions_organization_secret: {
			version: 0
			block: {
				attributes: {
					created_at: {
						type:             "string"
						description:      "Date of 'actions_secret' creation."
						description_kind: "plain"
						computed:         true
					}
					encrypted_value: {
						type:             "string"
						description:      "Encrypted value of the secret using the GitHub public key in Base64 format."
						description_kind: "plain"
						optional:         true
						sensitive:        true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					plaintext_value: {
						type:             "string"
						description:      "Plaintext value of the secret to be encrypted."
						description_kind: "plain"
						optional:         true
						sensitive:        true
					}
					secret_name: {
						type:             "string"
						description:      "Name of the secret."
						description_kind: "plain"
						required:         true
					}
					selected_repository_ids: {
						type: ["set", "number"]
						description:      "An array of repository ids that can access the organization secret."
						description_kind: "plain"
						optional:         true
					}
					updated_at: {
						type:             "string"
						description:      "Date of 'actions_secret' update."
						description_kind: "plain"
						computed:         true
					}
					visibility: {
						type:             "string"
						description:      "Configures the access that repositories have to the organization secret. Must be one of 'all', 'private', or 'selected'. 'selected_repository_ids' is required if set to 'selected'."
						description_kind: "plain"
						required:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_actions_organization_secret_repositories: {
			version: 0
			block: {
				attributes: {
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					secret_name: {
						type:             "string"
						description:      "Name of the existing secret."
						description_kind: "plain"
						required:         true
					}
					selected_repository_ids: {
						type: ["set", "number"]
						description:      "An array of repository ids that can access the organization secret."
						description_kind: "plain"
						required:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_actions_organization_variable: {
			version: 0
			block: {
				attributes: {
					created_at: {
						type:             "string"
						description:      "Date of 'actions_variable' creation."
						description_kind: "plain"
						computed:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					selected_repository_ids: {
						type: ["set", "number"]
						description:      "An array of repository ids that can access the organization variable."
						description_kind: "plain"
						optional:         true
					}
					updated_at: {
						type:             "string"
						description:      "Date of 'actions_variable' update."
						description_kind: "plain"
						computed:         true
					}
					value: {
						type:             "string"
						description:      "Value of the variable."
						description_kind: "plain"
						required:         true
					}
					variable_name: {
						type:             "string"
						description:      "Name of the variable."
						description_kind: "plain"
						required:         true
					}
					visibility: {
						type:             "string"
						description:      "Configures the access that repositories have to the organization variable. Must be one of 'all', 'private', or 'selected'. 'selected_repository_ids' is required if set to 'selected'."
						description_kind: "plain"
						required:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_actions_repository_access_level: {
			version: 0
			block: {
				attributes: {
					access_level: {
						type:             "string"
						description:      "Where the actions or reusable workflows of the repository may be used. Possible values are 'none', 'user', 'organization', or 'enterprise'."
						description_kind: "plain"
						required:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					repository: {
						type:             "string"
						description:      "The GitHub repository."
						description_kind: "plain"
						required:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_actions_repository_oidc_subject_claim_customization_template: {
			version: 0
			block: {
				attributes: {
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					include_claim_keys: {
						type: ["list", "string"]
						description:      "A list of OpenID Connect claims."
						description_kind: "plain"
						optional:         true
					}
					repository: {
						type:             "string"
						description:      "The name of the repository."
						description_kind: "plain"
						required:         true
					}
					use_default: {
						type:             "bool"
						description:      "Whether to use the default template or not. If 'true', 'include_claim_keys' must not be set."
						description_kind: "plain"
						required:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_actions_repository_permissions: {
			version: 0
			block: {
				attributes: {
					allowed_actions: {
						type:             "string"
						description:      "The permissions policy that controls the actions that are allowed to run. Can be one of: 'all', 'local_only', or 'selected'."
						description_kind: "plain"
						optional:         true
					}
					enabled: {
						type:             "bool"
						description:      "Should GitHub actions be enabled on this repository."
						description_kind: "plain"
						optional:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					repository: {
						type:             "string"
						description:      "The GitHub repository."
						description_kind: "plain"
						required:         true
					}
				}
				block_types: allowed_actions_config: {
					nesting_mode: "list"
					block: {
						attributes: {
							github_owned_allowed: {
								type:             "bool"
								description:      "Whether GitHub-owned actions are allowed in the repository."
								description_kind: "plain"
								required:         true
							}
							patterns_allowed: {
								type: ["set", "string"]
								description:      "Specifies a list of string-matching patterns to allow specific action(s). Wildcards, tags, and SHAs are allowed. For example, 'monalisa/octocat@', 'monalisa/octocat@v2', 'monalisa/'."
								description_kind: "plain"
								optional:         true
							}
							verified_allowed: {
								type:             "bool"
								description:      "Whether actions in GitHub Marketplace from verified creators are allowed. Set to 'true' to allow all GitHub Marketplace actions by verified creators."
								description_kind: "plain"
								optional:         true
							}
						}
						description:      "Sets the actions that are allowed in an repository. Only available when 'allowed_actions' = 'selected'. "
						description_kind: "plain"
					}
					max_items: 1
				}
				description_kind: "plain"
			}
		}
		github_actions_runner_group: {
			version: 0
			block: {
				attributes: {
					allows_public_repositories: {
						type:             "bool"
						description:      "Whether public repositories can be added to the runner group."
						description_kind: "plain"
						optional:         true
					}
					default: {
						type:             "bool"
						description:      "Whether this is the default runner group."
						description_kind: "plain"
						computed:         true
					}
					etag: {
						type:             "string"
						description:      "An etag representing the runner group object"
						description_kind: "plain"
						computed:         true
					}
					id: {
						type:             "string"
						description:      "The ID of the runner group."
						description_kind: "plain"
						computed:         true
					}
					inherited: {
						type:             "bool"
						description:      "Whether the runner group is inherited from the enterprise level"
						description_kind: "plain"
						computed:         true
					}
					name: {
						type:             "string"
						description:      "Name of the runner group."
						description_kind: "plain"
						required:         true
					}
					restricted_to_workflows: {
						type:             "bool"
						description:      "If 'true', the runner group will be restricted to running only the workflows specified in the 'selected_workflows' array. Defaults to 'false'."
						description_kind: "plain"
						optional:         true
					}
					runners_url: {
						type:             "string"
						description:      "The GitHub API URL for the runner group's runners."
						description_kind: "plain"
						computed:         true
					}
					selected_repositories_url: {
						type:             "string"
						description:      "GitHub API URL for the runner group's repositories."
						description_kind: "plain"
						computed:         true
					}
					selected_repository_ids: {
						type: ["set", "number"]
						description:      "List of repository IDs that can access the runner group."
						description_kind: "plain"
						optional:         true
					}
					selected_workflows: {
						type: ["list", "string"]
						description:      "List of workflows the runner group should be allowed to run. This setting will be ignored unless restricted_to_workflows is set to 'true'."
						description_kind: "plain"
						optional:         true
					}
					visibility: {
						type:             "string"
						description:      "The visibility of the runner group."
						description_kind: "plain"
						required:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_actions_secret: {
			version: 0
			block: {
				attributes: {
					created_at: {
						type:             "string"
						description:      "Date of 'actions_secret' creation."
						description_kind: "plain"
						computed:         true
					}
					encrypted_value: {
						type:             "string"
						description:      "Encrypted value of the secret using the GitHub public key in Base64 format."
						description_kind: "plain"
						optional:         true
						sensitive:        true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					plaintext_value: {
						type:             "string"
						description:      "Plaintext value of the secret to be encrypted."
						description_kind: "plain"
						optional:         true
						sensitive:        true
					}
					repository: {
						type:             "string"
						description:      "Name of the repository."
						description_kind: "plain"
						required:         true
					}
					secret_name: {
						type:             "string"
						description:      "Name of the secret."
						description_kind: "plain"
						required:         true
					}
					updated_at: {
						type:             "string"
						description:      "Date of 'actions_secret' update."
						description_kind: "plain"
						computed:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_actions_variable: {
			version: 0
			block: {
				attributes: {
					created_at: {
						type:             "string"
						description:      "Date of 'actions_variable' creation."
						description_kind: "plain"
						computed:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					repository: {
						type:             "string"
						description:      "Name of the repository."
						description_kind: "plain"
						required:         true
					}
					updated_at: {
						type:             "string"
						description:      "Date of 'actions_variable' update."
						description_kind: "plain"
						computed:         true
					}
					value: {
						type:             "string"
						description:      "Value of the variable."
						description_kind: "plain"
						required:         true
					}
					variable_name: {
						type:             "string"
						description:      "Name of the variable."
						description_kind: "plain"
						required:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_app_installation_repositories: {
			version: 0
			block: {
				attributes: {
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					installation_id: {
						type:             "string"
						description:      "The GitHub app installation id."
						description_kind: "plain"
						required:         true
					}
					selected_repositories: {
						type: ["set", "string"]
						description:      "A list of repository names to install the app on."
						description_kind: "plain"
						required:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_app_installation_repository: {
			version: 0
			block: {
				attributes: {
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					installation_id: {
						type:             "string"
						description:      "The GitHub app installation id."
						description_kind: "plain"
						required:         true
					}
					repo_id: {
						type:             "number"
						description_kind: "plain"
						computed:         true
					}
					repository: {
						type:             "string"
						description:      "The repository to install the app on."
						description_kind: "plain"
						required:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_branch: {
			version: 0
			block: {
				attributes: {
					branch: {
						type:             "string"
						description:      "The repository branch to create."
						description_kind: "plain"
						required:         true
					}
					etag: {
						type:             "string"
						description:      "An etag representing the Branch object."
						description_kind: "plain"
						computed:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					ref: {
						type:             "string"
						description:      "A string representing a branch reference, in the form of 'refs/heads/<branch>'."
						description_kind: "plain"
						computed:         true
					}
					repository: {
						type:             "string"
						description:      "The GitHub repository name."
						description_kind: "plain"
						required:         true
					}
					sha: {
						type:             "string"
						description:      "A string storing the reference's HEAD commit's SHA1."
						description_kind: "plain"
						computed:         true
					}
					source_branch: {
						type:             "string"
						description:      "The branch name to start from. Defaults to 'main'."
						description_kind: "plain"
						optional:         true
					}
					source_sha: {
						type:             "string"
						description:      "The commit hash to start from. Defaults to the tip of 'source_branch'. If provided, 'source_branch' is ignored."
						description_kind: "plain"
						optional:         true
						computed:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_branch_default: {
			version: 0
			block: {
				attributes: {
					branch: {
						type:             "string"
						description:      "The branch (e.g. 'main')."
						description_kind: "plain"
						required:         true
					}
					etag: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					rename: {
						type:             "bool"
						description:      "Indicate if it should rename the branch rather than use an existing branch. Defaults to 'false'."
						description_kind: "plain"
						optional:         true
					}
					repository: {
						type:             "string"
						description:      "The GitHub repository."
						description_kind: "plain"
						required:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_branch_protection: {
			version: 2
			block: {
				attributes: {
					allows_deletions: {
						type:             "bool"
						description:      "Setting this to 'true' to allow the branch to be deleted."
						description_kind: "plain"
						optional:         true
					}
					allows_force_pushes: {
						type:             "bool"
						description:      "Setting this to 'true' to allow force pushes on the branch."
						description_kind: "plain"
						optional:         true
					}
					enforce_admins: {
						type:             "bool"
						description:      "Setting this to 'true' enforces status checks for repository administrators."
						description_kind: "plain"
						optional:         true
					}
					force_push_bypassers: {
						type: ["set", "string"]
						description:      "The list of actor Names/IDs that are allowed to bypass force push restrictions. Actor names must either begin with a '/' for users or the organization name followed by a '/' for teams."
						description_kind: "plain"
						optional:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					lock_branch: {
						type:             "bool"
						description:      "Setting this to 'true' will make the branch read-only and preventing any pushes to it."
						description_kind: "plain"
						optional:         true
					}
					pattern: {
						type:             "string"
						description:      "Identifies the protection rule pattern."
						description_kind: "plain"
						required:         true
					}
					repository_id: {
						type:             "string"
						description:      "The name or node ID of the repository associated with this branch protection rule."
						description_kind: "plain"
						required:         true
					}
					require_conversation_resolution: {
						type:             "bool"
						description:      "Setting this to 'true' requires all conversations on code must be resolved before a pull request can be merged."
						description_kind: "plain"
						optional:         true
					}
					require_signed_commits: {
						type:             "bool"
						description:      "Setting this to 'true' requires all commits to be signed with GPG."
						description_kind: "plain"
						optional:         true
					}
					required_linear_history: {
						type:             "bool"
						description:      "Setting this to 'true' enforces a linear commit Git history, which prevents anyone from pushing merge commits to a branch."
						description_kind: "plain"
						optional:         true
					}
				}
				block_types: {
					required_pull_request_reviews: {
						nesting_mode: "list"
						block: {
							attributes: {
								dismiss_stale_reviews: {
									type:             "bool"
									description:      "Dismiss approved reviews automatically when a new commit is pushed."
									description_kind: "plain"
									optional:         true
								}
								dismissal_restrictions: {
									type: ["set", "string"]
									description:      "The list of actor Names/IDs with dismissal access. If not empty, 'restrict_dismissals' is ignored. Actor names must either begin with a '/' for users or the organization name followed by a '/' for teams."
									description_kind: "plain"
									optional:         true
								}
								pull_request_bypassers: {
									type: ["set", "string"]
									description:      "The list of actor Names/IDs that are allowed to bypass pull request requirements. Actor names must either begin with a '/' for users or the organization name followed by a '/' for teams."
									description_kind: "plain"
									optional:         true
								}
								require_code_owner_reviews: {
									type:             "bool"
									description:      "Require an approved review in pull requests including files with a designated code owner."
									description_kind: "plain"
									optional:         true
								}
								require_last_push_approval: {
									type:             "bool"
									description:      "Require that The most recent push must be approved by someone other than the last pusher."
									description_kind: "plain"
									optional:         true
								}
								required_approving_review_count: {
									type:             "number"
									description:      "Require 'x' number of approvals to satisfy branch protection requirements. If this is specified it must be a number between 0-6."
									description_kind: "plain"
									optional:         true
								}
								restrict_dismissals: {
									type:             "bool"
									description:      "Restrict pull request review dismissals."
									description_kind: "plain"
									optional:         true
								}
							}
							description:      "Enforce restrictions for pull request reviews."
							description_kind: "plain"
						}
					}
					required_status_checks: {
						nesting_mode: "list"
						block: {
							attributes: {
								contexts: {
									type: ["set", "string"]
									description:      "The list of status checks to require in order to merge into this branch. No status checks are required by default."
									description_kind: "plain"
									optional:         true
								}
								strict: {
									type:             "bool"
									description:      "Require branches to be up to date before merging."
									description_kind: "plain"
									optional:         true
								}
							}
							description:      "Enforce restrictions for required status checks."
							description_kind: "plain"
						}
					}
					restrict_pushes: {
						nesting_mode: "list"
						block: {
							attributes: {
								blocks_creations: {
									type:             "bool"
									description:      "Restrict pushes that create matching branches."
									description_kind: "plain"
									optional:         true
								}
								push_allowances: {
									type: ["set", "string"]
									description:      "The list of actor Names/IDs that may push to the branch. Actor names must either begin with a '/' for users or the organization name followed by a '/' for teams."
									description_kind: "plain"
									optional:         true
								}
							}
							description:      "Restrict who can push to matching branches."
							description_kind: "plain"
						}
					}
				}
				description_kind: "plain"
			}
		}
		github_branch_protection_v3: {
			version: 0
			block: {
				attributes: {
					branch: {
						type:             "string"
						description:      "The Git branch to protect."
						description_kind: "plain"
						required:         true
					}
					enforce_admins: {
						type:             "bool"
						description:      "Setting this to 'true' enforces status checks for repository administrators."
						description_kind: "plain"
						optional:         true
					}
					etag: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					repository: {
						type:             "string"
						description:      "The GitHub repository name."
						description_kind: "plain"
						required:         true
					}
					require_conversation_resolution: {
						type:             "bool"
						description:      "Setting this to 'true' requires all conversations on code must be resolved before a pull request can be merged."
						description_kind: "plain"
						optional:         true
					}
					require_signed_commits: {
						type:             "bool"
						description:      "Setting this to 'true' requires all commits to be signed with GPG."
						description_kind: "plain"
						optional:         true
					}
				}
				block_types: {
					required_pull_request_reviews: {
						nesting_mode: "list"
						block: {
							attributes: {
								dismiss_stale_reviews: {
									type:             "bool"
									description:      "Dismiss approved reviews automatically when a new commit is pushed."
									description_kind: "plain"
									optional:         true
								}
								dismissal_apps: {
									type: ["set", "string"]
									description:      "The list of apps slugs with dismissal access. Always use slug of the app, not its name. Each app already has to have access to the repository."
									description_kind: "plain"
									optional:         true
								}
								dismissal_teams: {
									type: ["set", "string"]
									description:      "The list of team slugs with dismissal access. Always use slug of the team, not its name. Each team already has to have access to the repository."
									description_kind: "plain"
									optional:         true
								}
								dismissal_users: {
									type: ["set", "string"]
									description:      "The list of user logins with dismissal access."
									description_kind: "plain"
									optional:         true
								}
								include_admins: {
									type:             "bool"
									description_kind: "plain"
									deprecated:       true
									optional:         true
								}
								require_code_owner_reviews: {
									type:             "bool"
									description:      "Require an approved review in pull requests including files with a designated code owner."
									description_kind: "plain"
									optional:         true
								}
								require_last_push_approval: {
									type:             "bool"
									description:      "Require that the most recent push must be approved by someone other than the last pusher."
									description_kind: "plain"
									optional:         true
								}
								required_approving_review_count: {
									type:             "number"
									description:      "Require 'x' number of approvals to satisfy branch protection requirements. If this is specified it must be a number between 0-6."
									description_kind: "plain"
									optional:         true
								}
							}
							block_types: bypass_pull_request_allowances: {
								nesting_mode: "list"
								block: {
									attributes: {
										apps: {
											type: ["set", "string"]
											description_kind: "plain"
											optional:         true
										}
										teams: {
											type: ["set", "string"]
											description_kind: "plain"
											optional:         true
										}
										users: {
											type: ["set", "string"]
											description_kind: "plain"
											optional:         true
										}
									}
									description_kind: "plain"
								}
								max_items: 1
							}
							description:      "Enforce restrictions for pull request reviews."
							description_kind: "plain"
						}
						max_items: 1
					}
					required_status_checks: {
						nesting_mode: "list"
						block: {
							attributes: {
								checks: {
									type: ["set", "string"]
									description:      "The list of status checks to require in order to merge into this branch. No status checks are required by default. Checks should be strings containing the 'context' and 'app_id' like so 'context:app_id'"
									description_kind: "plain"
									optional:         true
								}
								contexts: {
									type: ["set", "string"]
									description_kind: "plain"
									deprecated:       true
									optional:         true
								}
								include_admins: {
									type:             "bool"
									description_kind: "plain"
									deprecated:       true
									optional:         true
								}
								strict: {
									type:             "bool"
									description:      "Require branches to be up to date before merging."
									description_kind: "plain"
									optional:         true
								}
							}
							description:      "Enforce restrictions for required status checks."
							description_kind: "plain"
						}
						max_items: 1
					}
					restrictions: {
						nesting_mode: "list"
						block: {
							attributes: {
								apps: {
									type: ["set", "string"]
									description:      "The list of app slugs with push access."
									description_kind: "plain"
									optional:         true
								}
								teams: {
									type: ["set", "string"]
									description:      "The list of team slugs with push access. Always use slug of the team, not its name. Each team already has to have access to the repository."
									description_kind: "plain"
									optional:         true
								}
								users: {
									type: ["set", "string"]
									description:      "The list of user logins with push access."
									description_kind: "plain"
									optional:         true
								}
							}
							description:      "Enforce restrictions for the users and teams that may push to the branch."
							description_kind: "plain"
						}
						max_items: 1
					}
				}
				description_kind: "plain"
			}
		}
		github_codespaces_organization_secret: {
			version: 0
			block: {
				attributes: {
					created_at: {
						type:             "string"
						description:      "Date of 'codespaces_secret' creation."
						description_kind: "plain"
						computed:         true
					}
					encrypted_value: {
						type:             "string"
						description:      "Encrypted value of the secret using the GitHub public key in Base64 format."
						description_kind: "plain"
						optional:         true
						sensitive:        true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					plaintext_value: {
						type:             "string"
						description:      "Plaintext value of the secret to be encrypted."
						description_kind: "plain"
						optional:         true
						sensitive:        true
					}
					secret_name: {
						type:             "string"
						description:      "Name of the secret."
						description_kind: "plain"
						required:         true
					}
					selected_repository_ids: {
						type: ["set", "number"]
						description:      "An array of repository ids that can access the organization secret."
						description_kind: "plain"
						optional:         true
					}
					updated_at: {
						type:             "string"
						description:      "Date of 'codespaces_secret' update."
						description_kind: "plain"
						computed:         true
					}
					visibility: {
						type:             "string"
						description:      "Configures the access that repositories have to the organization secret. Must be one of 'all', 'private' or 'selected'. 'selected_repository_ids' is required if set to 'selected'."
						description_kind: "plain"
						required:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_codespaces_organization_secret_repositories: {
			version: 0
			block: {
				attributes: {
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					secret_name: {
						type:             "string"
						description:      "Name of the existing secret."
						description_kind: "plain"
						required:         true
					}
					selected_repository_ids: {
						type: ["set", "number"]
						description:      "An array of repository ids that can access the organization secret."
						description_kind: "plain"
						required:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_codespaces_secret: {
			version: 0
			block: {
				attributes: {
					created_at: {
						type:             "string"
						description:      "Date of 'codespaces_secret' creation."
						description_kind: "plain"
						computed:         true
					}
					encrypted_value: {
						type:             "string"
						description:      "Encrypted value of the secret using the GitHub public key in Base64 format."
						description_kind: "plain"
						optional:         true
						sensitive:        true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					plaintext_value: {
						type:             "string"
						description:      "Plaintext value of the secret to be encrypted."
						description_kind: "plain"
						optional:         true
						sensitive:        true
					}
					repository: {
						type:             "string"
						description:      "Name of the repository."
						description_kind: "plain"
						required:         true
					}
					secret_name: {
						type:             "string"
						description:      "Name of the secret."
						description_kind: "plain"
						required:         true
					}
					updated_at: {
						type:             "string"
						description:      "Date of 'codespaces_secret' update."
						description_kind: "plain"
						computed:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_codespaces_user_secret: {
			version: 0
			block: {
				attributes: {
					created_at: {
						type:             "string"
						description:      "Date of 'codespaces_secret' creation."
						description_kind: "plain"
						computed:         true
					}
					encrypted_value: {
						type:             "string"
						description:      "Encrypted value of the secret using the GitHub public key in Base64 format."
						description_kind: "plain"
						optional:         true
						sensitive:        true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					plaintext_value: {
						type:             "string"
						description:      "Plaintext value of the secret to be encrypted."
						description_kind: "plain"
						optional:         true
						sensitive:        true
					}
					secret_name: {
						type:             "string"
						description:      "Name of the secret."
						description_kind: "plain"
						required:         true
					}
					selected_repository_ids: {
						type: ["set", "number"]
						description:      "An array of repository ids that can access the user secret."
						description_kind: "plain"
						optional:         true
					}
					updated_at: {
						type:             "string"
						description:      "Date of 'codespaces_secret' update."
						description_kind: "plain"
						computed:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_dependabot_organization_secret: {
			version: 0
			block: {
				attributes: {
					created_at: {
						type:             "string"
						description:      "Date of 'dependabot_secret' creation."
						description_kind: "plain"
						computed:         true
					}
					encrypted_value: {
						type:             "string"
						description:      "Encrypted value of the secret using the GitHub public key in Base64 format."
						description_kind: "plain"
						optional:         true
						sensitive:        true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					plaintext_value: {
						type:             "string"
						description:      "Plaintext value of the secret to be encrypted."
						description_kind: "plain"
						optional:         true
						sensitive:        true
					}
					secret_name: {
						type:             "string"
						description:      "Name of the secret."
						description_kind: "plain"
						required:         true
					}
					selected_repository_ids: {
						type: ["set", "number"]
						description:      "An array of repository ids that can access the organization secret."
						description_kind: "plain"
						optional:         true
					}
					updated_at: {
						type:             "string"
						description:      "Date of 'dependabot_secret' update."
						description_kind: "plain"
						computed:         true
					}
					visibility: {
						type:             "string"
						description:      "Configures the access that repositories have to the organization secret. Must be one of 'all', 'private' or 'selected'. 'selected_repository_ids' is required if set to 'selected'."
						description_kind: "plain"
						required:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_dependabot_organization_secret_repositories: {
			version: 0
			block: {
				attributes: {
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					secret_name: {
						type:             "string"
						description:      "Name of the existing secret."
						description_kind: "plain"
						required:         true
					}
					selected_repository_ids: {
						type: ["set", "number"]
						description:      "An array of repository ids that can access the organization secret."
						description_kind: "plain"
						required:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_dependabot_secret: {
			version: 0
			block: {
				attributes: {
					created_at: {
						type:             "string"
						description:      "Date of 'dependabot_secret' creation."
						description_kind: "plain"
						computed:         true
					}
					encrypted_value: {
						type:             "string"
						description:      "Encrypted value of the secret using the GitHub public key in Base64 format."
						description_kind: "plain"
						optional:         true
						sensitive:        true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					plaintext_value: {
						type:             "string"
						description:      "Plaintext value of the secret to be encrypted."
						description_kind: "plain"
						optional:         true
						sensitive:        true
					}
					repository: {
						type:             "string"
						description:      "Name of the repository."
						description_kind: "plain"
						required:         true
					}
					secret_name: {
						type:             "string"
						description:      "Name of the secret."
						description_kind: "plain"
						required:         true
					}
					updated_at: {
						type:             "string"
						description:      "Date of 'dependabot_secret' update."
						description_kind: "plain"
						computed:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_emu_group_mapping: {
			version: 0
			block: {
				attributes: {
					etag: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					group_id: {
						type:             "number"
						description:      "Integer corresponding to the external group ID to be linked."
						description_kind: "plain"
						required:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					team_slug: {
						type:             "string"
						description:      "Slug of the GitHub team."
						description_kind: "plain"
						required:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_enterprise_actions_permissions: {
			version: 0
			block: {
				attributes: {
					allowed_actions: {
						type:             "string"
						description:      "The permissions policy that controls the actions that are allowed to run. Can be one of: 'all', 'local_only', or 'selected'."
						description_kind: "plain"
						optional:         true
					}
					enabled_organizations: {
						type:             "string"
						description:      "The policy that controls the organizations in the enterprise that are allowed to run GitHub Actions. Can be one of: 'all', 'none', or 'selected'."
						description_kind: "plain"
						required:         true
					}
					enterprise_slug: {
						type:             "string"
						description:      "The slug of the enterprise."
						description_kind: "plain"
						required:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
				}
				block_types: {
					allowed_actions_config: {
						nesting_mode: "list"
						block: {
							attributes: {
								github_owned_allowed: {
									type:             "bool"
									description:      "Whether GitHub-owned actions are allowed in the enterprise."
									description_kind: "plain"
									required:         true
								}
								patterns_allowed: {
									type: ["set", "string"]
									description:      "Specifies a list of string-matching patterns to allow specific action(s). Wildcards, tags, and SHAs are allowed. For example, 'monalisa/octocat@', 'monalisa/octocat@v2', 'monalisa/'."
									description_kind: "plain"
									optional:         true
								}
								verified_allowed: {
									type:             "bool"
									description:      "Whether actions in GitHub Marketplace from verified creators are allowed. Set to 'true' to allow all GitHub Marketplace actions by verified creators."
									description_kind: "plain"
									optional:         true
								}
							}
							description:      "Sets the actions that are allowed in an enterprise. Only available when 'allowed_actions' = 'selected'"
							description_kind: "plain"
						}
						max_items: 1
					}
					enabled_organizations_config: {
						nesting_mode: "list"
						block: {
							attributes: organization_ids: {
								type: ["set", "number"]
								description:      "List of organization IDs to enable for GitHub Actions."
								description_kind: "plain"
								required:         true
							}
							description:      "Sets the list of selected organizations that are enabled for GitHub Actions in an enterprise. Only available when 'enabled_organizations' = 'selected'."
							description_kind: "plain"
						}
						max_items: 1
					}
				}
				description_kind: "plain"
			}
		}
		github_enterprise_actions_runner_group: {
			version: 0
			block: {
				attributes: {
					allows_public_repositories: {
						type:             "bool"
						description:      "Whether public repositories can be added to the runner group."
						description_kind: "plain"
						optional:         true
					}
					default: {
						type:             "bool"
						description:      "Whether this is the default runner group."
						description_kind: "plain"
						computed:         true
					}
					enterprise_slug: {
						type:             "string"
						description:      "The slug of the enterprise."
						description_kind: "plain"
						required:         true
					}
					etag: {
						type:             "string"
						description:      "An etag representing the runner group object"
						description_kind: "plain"
						computed:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					name: {
						type:             "string"
						description:      "Name of the runner group."
						description_kind: "plain"
						required:         true
					}
					restricted_to_workflows: {
						type:             "bool"
						description:      "If 'true', the runner group will be restricted to running only the workflows specified in the 'selected_workflows' array. Defaults to 'false'."
						description_kind: "plain"
						optional:         true
					}
					runners_url: {
						type:             "string"
						description:      "The GitHub API URL for the runner group's runners."
						description_kind: "plain"
						computed:         true
					}
					selected_organization_ids: {
						type: ["set", "number"]
						description:      "List of organization IDs that can access the runner group."
						description_kind: "plain"
						optional:         true
					}
					selected_organizations_url: {
						type:             "string"
						description:      "GitHub API URL for the runner group's organizations."
						description_kind: "plain"
						computed:         true
					}
					selected_workflows: {
						type: ["list", "string"]
						description:      "List of workflows the runner group should be allowed to run. This setting will be ignored unless restricted_to_workflows is set to 'true'."
						description_kind: "plain"
						optional:         true
					}
					visibility: {
						type:             "string"
						description:      "The visibility of the runner group."
						description_kind: "plain"
						required:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_enterprise_organization: {
			version: 0
			block: {
				attributes: {
					admin_logins: {
						type: ["set", "string"]
						description:      "List of organization owner usernames."
						description_kind: "plain"
						required:         true
					}
					billing_email: {
						type:             "string"
						description:      "The billing email address."
						description_kind: "plain"
						required:         true
					}
					database_id: {
						type:             "number"
						description:      "The database ID of the organization."
						description_kind: "plain"
						computed:         true
					}
					description: {
						type:             "string"
						description:      "The description of the organization."
						description_kind: "plain"
						optional:         true
					}
					display_name: {
						type:             "string"
						description:      "The display name of the organization."
						description_kind: "plain"
						optional:         true
					}
					enterprise_id: {
						type:             "string"
						description:      "The ID of the enterprise."
						description_kind: "plain"
						required:         true
					}
					id: {
						type:             "string"
						description:      "The node ID of the organization."
						description_kind: "plain"
						computed:         true
					}
					name: {
						type:             "string"
						description:      "The name of the organization."
						description_kind: "plain"
						required:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_issue: {
			version: 0
			block: {
				attributes: {
					assignees: {
						type: ["set", "string"]
						description:      "List of Logins to assign to the issue."
						description_kind: "plain"
						optional:         true
					}
					body: {
						type:             "string"
						description:      "Body of the issue."
						description_kind: "plain"
						optional:         true
					}
					etag: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					issue_id: {
						type:             "number"
						description:      "The issue id."
						description_kind: "plain"
						computed:         true
					}
					labels: {
						type: ["set", "string"]
						description:      "List of labels to attach to the issue."
						description_kind: "plain"
						optional:         true
					}
					milestone_number: {
						type:             "number"
						description:      "Milestone number to assign to the issue."
						description_kind: "plain"
						optional:         true
					}
					number: {
						type:             "number"
						description:      "The issue number."
						description_kind: "plain"
						computed:         true
					}
					repository: {
						type:             "string"
						description:      "The GitHub repository name."
						description_kind: "plain"
						required:         true
					}
					title: {
						type:             "string"
						description:      "Title of the issue."
						description_kind: "plain"
						required:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_issue_label: {
			version: 0
			block: {
				attributes: {
					color: {
						type:             "string"
						description:      "A 6 character hex code, without the leading '#', identifying the color of the label."
						description_kind: "plain"
						required:         true
					}
					description: {
						type:             "string"
						description:      "A short description of the label."
						description_kind: "plain"
						optional:         true
					}
					etag: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					name: {
						type:             "string"
						description:      "The name of the label."
						description_kind: "plain"
						required:         true
					}
					repository: {
						type:             "string"
						description:      "The GitHub repository."
						description_kind: "plain"
						required:         true
					}
					url: {
						type:             "string"
						description:      "The URL to the issue label."
						description_kind: "plain"
						computed:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_issue_labels: {
			version: 0
			block: {
				attributes: {
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					repository: {
						type:             "string"
						description:      "The GitHub repository."
						description_kind: "plain"
						required:         true
					}
				}
				block_types: label: {
					nesting_mode: "set"
					block: {
						attributes: {
							color: {
								type:             "string"
								description:      "A 6 character hex code, without the leading '#', identifying the color of the label."
								description_kind: "plain"
								required:         true
							}
							description: {
								type:             "string"
								description:      "A short description of the label."
								description_kind: "plain"
								optional:         true
							}
							name: {
								type:             "string"
								description:      "The name of the label."
								description_kind: "plain"
								required:         true
							}
							url: {
								type:             "string"
								description:      "The URL to the issue label."
								description_kind: "plain"
								computed:         true
							}
						}
						description:      "List of labels"
						description_kind: "plain"
					}
				}
				description_kind: "plain"
			}
		}
		github_membership: {
			version: 0
			block: {
				attributes: {
					downgrade_on_destroy: {
						type:             "bool"
						description:      "Instead of removing the member from the org, you can choose to downgrade their membership to 'member' when this resource is destroyed. This is useful when wanting to downgrade admins while keeping them in the organization"
						description_kind: "plain"
						optional:         true
					}
					etag: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					role: {
						type:             "string"
						description:      "The role of the user within the organization. Must be one of 'member' or 'admin'."
						description_kind: "plain"
						optional:         true
					}
					username: {
						type:             "string"
						description:      "The user to add to the organization."
						description_kind: "plain"
						required:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_organization_block: {
			version: 0
			block: {
				attributes: {
					etag: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					username: {
						type:             "string"
						description:      "The name of the user to block."
						description_kind: "plain"
						required:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_organization_custom_role: {
			version: 0
			block: {
				attributes: {
					base_role: {
						type:             "string"
						description:      "The base role for the custom repository role."
						description_kind: "plain"
						required:         true
					}
					description: {
						type:             "string"
						description:      "The description of the custom repository role."
						description_kind: "plain"
						optional:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					name: {
						type:             "string"
						description:      "The organization custom repository role to create."
						description_kind: "plain"
						required:         true
					}
					permissions: {
						type: ["set", "string"]
						description:      "The permissions for the custom repository role."
						description_kind: "plain"
						required:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_organization_project: {
			version: 0
			block: {
				attributes: {
					body: {
						type:             "string"
						description:      "The body of the project."
						description_kind: "plain"
						optional:         true
					}
					etag: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					name: {
						type:             "string"
						description:      "The name of the project."
						description_kind: "plain"
						required:         true
					}
					url: {
						type:             "string"
						description:      "URL of the project."
						description_kind: "plain"
						computed:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_organization_ruleset: {
			version: 1
			block: {
				attributes: {
					enforcement: {
						type:             "string"
						description:      "Possible values for Enforcement are `disabled`, `active`, `evaluate`. Note: `evaluate` is currently only supported for owners of type `organization`."
						description_kind: "plain"
						required:         true
					}
					etag: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					name: {
						type:             "string"
						description:      "The name of the ruleset."
						description_kind: "plain"
						required:         true
					}
					node_id: {
						type:             "string"
						description:      "GraphQL global node id for use with v4 API."
						description_kind: "plain"
						computed:         true
					}
					ruleset_id: {
						type:             "number"
						description:      "GitHub ID for the ruleset."
						description_kind: "plain"
						computed:         true
					}
					target: {
						type:             "string"
						description:      "Possible values are `branch` and `tag`."
						description_kind: "plain"
						required:         true
					}
				}
				block_types: {
					bypass_actors: {
						nesting_mode: "list"
						block: {
							attributes: {
								actor_id: {
									type:             "number"
									description:      "The ID of the actor that can bypass a ruleset. When `actor_type` is `OrganizationAdmin`, this should be set to `1`."
									description_kind: "plain"
									required:         true
								}
								actor_type: {
									type:             "string"
									description:      "The type of actor that can bypass a ruleset. Can be one of: `RepositoryRole`, `Team`, `Integration`, `OrganizationAdmin`."
									description_kind: "plain"
									required:         true
								}
								bypass_mode: {
									type:             "string"
									description:      "When the specified actor can bypass the ruleset. pull_request means that an actor can only bypass rules on pull requests. Can be one of: `always`, `pull_request`."
									description_kind: "plain"
									required:         true
								}
							}
							description:      "The actors that can bypass the rules in this ruleset."
							description_kind: "plain"
						}
					}
					conditions: {
						nesting_mode: "list"
						block: {
							attributes: repository_id: {
								type: ["list", "number"]
								description:      "The repository IDs that the ruleset applies to. One of these IDs must match for the condition to pass."
								description_kind: "plain"
								optional:         true
							}
							block_types: {
								ref_name: {
									nesting_mode: "list"
									block: {
										attributes: {
											exclude: {
												type: ["list", "string"]
												description:      "Array of ref names or patterns to exclude. The condition will not pass if any of these patterns match."
												description_kind: "plain"
												required:         true
											}
											include: {
												type: ["list", "string"]
												description:      "Array of ref names or patterns to include. One of these patterns must match for the condition to pass. Also accepts `~DEFAULT_BRANCH` to include the default branch or `~ALL` to include all branches."
												description_kind: "plain"
												required:         true
											}
										}
										description_kind: "plain"
									}
									min_items: 1
									max_items: 1
								}
								repository_name: {
									nesting_mode: "list"
									block: {
										attributes: {
											exclude: {
												type: ["list", "string"]
												description:      "Array of repository names or patterns to exclude. The condition will not pass if any of these patterns match."
												description_kind: "plain"
												required:         true
											}
											include: {
												type: ["list", "string"]
												description:      "Array of repository names or patterns to include. One of these patterns must match for the condition to pass. Also accepts `~ALL` to include all repositories."
												description_kind: "plain"
												required:         true
											}
											protected: {
												type:             "bool"
												description:      "Whether renaming of target repositories is prevented."
												description_kind: "plain"
												optional:         true
											}
										}
										description_kind: "plain"
									}
									max_items: 1
								}
							}
							description:      "Parameters for an organization ruleset condition. `ref_name` is required alongside one of `repository_name` or `repository_id`."
							description_kind: "plain"
						}
						max_items: 1
					}
					rules: {
						nesting_mode: "list"
						block: {
							attributes: {
								creation: {
									type:             "bool"
									description:      "Only allow users with bypass permission to create matching refs."
									description_kind: "plain"
									optional:         true
								}
								deletion: {
									type:             "bool"
									description:      "Only allow users with bypass permissions to delete matching refs."
									description_kind: "plain"
									optional:         true
								}
								non_fast_forward: {
									type:             "bool"
									description:      "Prevent users with push access from force pushing to branches."
									description_kind: "plain"
									optional:         true
								}
								required_linear_history: {
									type:             "bool"
									description:      "Prevent merge commits from being pushed to matching branches."
									description_kind: "plain"
									optional:         true
								}
								required_signatures: {
									type:             "bool"
									description:      "Commits pushed to matching branches must have verified signatures."
									description_kind: "plain"
									optional:         true
								}
								update: {
									type:             "bool"
									description:      "Only allow users with bypass permission to update matching refs."
									description_kind: "plain"
									optional:         true
								}
							}
							block_types: {
								branch_name_pattern: {
									nesting_mode: "list"
									block: {
										attributes: {
											name: {
												type:             "string"
												description:      "How this rule will appear to users."
												description_kind: "plain"
												optional:         true
											}
											negate: {
												type:             "bool"
												description:      "If true, the rule will fail if the pattern matches."
												description_kind: "plain"
												optional:         true
											}
											operator: {
												type:             "string"
												description:      "The operator to use for matching. Can be one of: `starts_with`, `ends_with`, `contains`, `regex`."
												description_kind: "plain"
												required:         true
											}
											pattern: {
												type:             "string"
												description:      "The pattern to match with."
												description_kind: "plain"
												required:         true
											}
										}
										description:      "Parameters to be used for the branch_name_pattern rule. This rule only applies to repositories within an enterprise, it cannot be applied to repositories owned by individuals or regular organizations. Conflicts with `tag_name_pattern` as it only applies to rulesets with target `branch`."
										description_kind: "plain"
									}
									max_items: 1
								}
								commit_author_email_pattern: {
									nesting_mode: "list"
									block: {
										attributes: {
											name: {
												type:             "string"
												description:      "How this rule will appear to users."
												description_kind: "plain"
												optional:         true
											}
											negate: {
												type:             "bool"
												description:      "If true, the rule will fail if the pattern matches."
												description_kind: "plain"
												optional:         true
											}
											operator: {
												type:             "string"
												description:      "The operator to use for matching. Can be one of: `starts_with`, `ends_with`, `contains`, `regex`."
												description_kind: "plain"
												required:         true
											}
											pattern: {
												type:             "string"
												description:      "The pattern to match with."
												description_kind: "plain"
												required:         true
											}
										}
										description:      "Parameters to be used for the commit_author_email_pattern rule."
										description_kind: "plain"
									}
									max_items: 1
								}
								commit_message_pattern: {
									nesting_mode: "list"
									block: {
										attributes: {
											name: {
												type:             "string"
												description:      "How this rule will appear to users."
												description_kind: "plain"
												optional:         true
											}
											negate: {
												type:             "bool"
												description:      "If true, the rule will fail if the pattern matches."
												description_kind: "plain"
												optional:         true
											}
											operator: {
												type:             "string"
												description:      "The operator to use for matching. Can be one of: `starts_with`, `ends_with`, `contains`, `regex`."
												description_kind: "plain"
												required:         true
											}
											pattern: {
												type:             "string"
												description:      "The pattern to match with."
												description_kind: "plain"
												required:         true
											}
										}
										description:      "Parameters to be used for the commit_message_pattern rule."
										description_kind: "plain"
									}
									max_items: 1
								}
								committer_email_pattern: {
									nesting_mode: "list"
									block: {
										attributes: {
											name: {
												type:             "string"
												description:      "How this rule will appear to users."
												description_kind: "plain"
												optional:         true
											}
											negate: {
												type:             "bool"
												description:      "If true, the rule will fail if the pattern matches."
												description_kind: "plain"
												optional:         true
											}
											operator: {
												type:             "string"
												description:      "The operator to use for matching. Can be one of: `starts_with`, `ends_with`, `contains`, `regex`."
												description_kind: "plain"
												required:         true
											}
											pattern: {
												type:             "string"
												description:      "The pattern to match with."
												description_kind: "plain"
												required:         true
											}
										}
										description:      "Parameters to be used for the committer_email_pattern rule."
										description_kind: "plain"
									}
									max_items: 1
								}
								pull_request: {
									nesting_mode: "list"
									block: {
										attributes: {
											dismiss_stale_reviews_on_push: {
												type:             "bool"
												description:      "New, reviewable commits pushed will dismiss previous pull request review approvals. Defaults to `false`."
												description_kind: "plain"
												optional:         true
											}
											require_code_owner_review: {
												type:             "bool"
												description:      "Require an approving review in pull requests that modify files that have a designated code owner. Defaults to `false`."
												description_kind: "plain"
												optional:         true
											}
											require_last_push_approval: {
												type:             "bool"
												description:      "Whether the most recent reviewable push must be approved by someone other than the person who pushed it. Defaults to `false`."
												description_kind: "plain"
												optional:         true
											}
											required_approving_review_count: {
												type:             "number"
												description:      "The number of approving reviews that are required before a pull request can be merged. Defaults to `0`."
												description_kind: "plain"
												optional:         true
											}
											required_review_thread_resolution: {
												type:             "bool"
												description:      "All conversations on code must be resolved before a pull request can be merged. Defaults to `false`."
												description_kind: "plain"
												optional:         true
											}
										}
										description:      "Require all commits be made to a non-target branch and submitted via a pull request before they can be merged."
										description_kind: "plain"
									}
									max_items: 1
								}
								required_status_checks: {
									nesting_mode: "list"
									block: {
										attributes: strict_required_status_checks_policy: {
											type:             "bool"
											description:      "Whether pull requests targeting a matching branch must be tested with the latest code. This setting will not take effect unless at least one status check is enabled. Defaults to `false`."
											description_kind: "plain"
											optional:         true
										}
										block_types: required_check: {
											nesting_mode: "set"
											block: {
												attributes: {
													context: {
														type:             "string"
														description:      "The status check context name that must be present on the commit."
														description_kind: "plain"
														required:         true
													}
													integration_id: {
														type:             "number"
														description:      "The optional integration ID that this status check must originate from."
														description_kind: "plain"
														optional:         true
													}
												}
												description:      "Status checks that are required. Several can be defined."
												description_kind: "plain"
											}
											min_items: 1
										}
										description:      "Choose which status checks must pass before branches can be merged into a branch that matches this rule. When enabled, commits must first be pushed to another branch, then merged or pushed directly to a branch that matches this rule after status checks have passed."
										description_kind: "plain"
									}
									max_items: 1
								}
								required_workflows: {
									nesting_mode: "list"
									block: {
										block_types: required_workflow: {
											nesting_mode: "set"
											block: {
												attributes: {
													path: {
														type:             "string"
														description:      "The path to the workflow YAML definition file."
														description_kind: "plain"
														required:         true
													}
													ref: {
														type:             "string"
														description:      "The ref (branch or tag) of the workflow file to use."
														description_kind: "plain"
														optional:         true
													}
													repository_id: {
														type:             "number"
														description:      "The repository in which the workflow is defined."
														description_kind: "plain"
														required:         true
													}
												}
												description:      "Actions workflows that are required. Several can be defined."
												description_kind: "plain"
											}
											min_items: 1
										}
										description:      "Choose which Actions workflows must pass before branches can be merged into a branch that matches this rule."
										description_kind: "plain"
									}
									max_items: 1
								}
								tag_name_pattern: {
									nesting_mode: "list"
									block: {
										attributes: {
											name: {
												type:             "string"
												description:      "How this rule will appear to users."
												description_kind: "plain"
												optional:         true
											}
											negate: {
												type:             "bool"
												description:      "If true, the rule will fail if the pattern matches."
												description_kind: "plain"
												optional:         true
											}
											operator: {
												type:             "string"
												description:      "The operator to use for matching. Can be one of: `starts_with`, `ends_with`, `contains`, `regex`."
												description_kind: "plain"
												required:         true
											}
											pattern: {
												type:             "string"
												description:      "The pattern to match with."
												description_kind: "plain"
												required:         true
											}
										}
										description:      "Parameters to be used for the tag_name_pattern rule. This rule only applies to repositories within an enterprise, it cannot be applied to repositories owned by individuals or regular organizations. Conflicts with `branch_name_pattern` as it only applies to rulesets with target `tag`."
										description_kind: "plain"
									}
									max_items: 1
								}
							}
							description:      "Rules within the ruleset."
							description_kind: "plain"
						}
						min_items: 1
						max_items: 1
					}
				}
				description_kind: "plain"
			}
		}
		github_organization_security_manager: {
			version: 0
			block: {
				attributes: {
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					team_slug: {
						type:             "string"
						description:      "The slug of the team to manage."
						description_kind: "plain"
						required:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_organization_settings: {
			version: 0
			block: {
				attributes: {
					advanced_security_enabled_for_new_repositories: {
						type:             "bool"
						description:      " Whether or not advanced security is enabled for new repositories."
						description_kind: "plain"
						optional:         true
					}
					billing_email: {
						type:             "string"
						description:      "The billing email address for the organization."
						description_kind: "plain"
						required:         true
					}
					blog: {
						type:             "string"
						description:      "The blog URL for the organization."
						description_kind: "plain"
						optional:         true
					}
					company: {
						type:             "string"
						description:      "The company name for the organization."
						description_kind: "plain"
						optional:         true
					}
					default_repository_permission: {
						type:             "string"
						description:      "The default permission for organization members to create new repositories. Can be one of 'read', 'write', 'admin' or 'none'."
						description_kind: "plain"
						optional:         true
					}
					dependabot_alerts_enabled_for_new_repositories: {
						type:             "bool"
						description:      "Whether or not dependabot alerts are enabled for new repositories."
						description_kind: "plain"
						optional:         true
					}
					dependabot_security_updates_enabled_for_new_repositories: {
						type:             "bool"
						description:      " Whether or not dependabot security updates are enabled for new repositories."
						description_kind: "plain"
						optional:         true
					}
					dependency_graph_enabled_for_new_repositories: {
						type:             "bool"
						description:      "Whether or not dependency graph is enabled for new repositories."
						description_kind: "plain"
						optional:         true
					}
					description: {
						type:             "string"
						description:      "The description for the organization."
						description_kind: "plain"
						optional:         true
					}
					email: {
						type:             "string"
						description:      "The email address for the organization."
						description_kind: "plain"
						optional:         true
					}
					has_organization_projects: {
						type:             "bool"
						description:      "Whether or not organization projects are enabled for the organization."
						description_kind: "plain"
						optional:         true
					}
					has_repository_projects: {
						type:             "bool"
						description:      "Whether or not repository projects are enabled for the organization."
						description_kind: "plain"
						optional:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					location: {
						type:             "string"
						description:      "The location for the organization."
						description_kind: "plain"
						optional:         true
					}
					members_can_create_internal_repositories: {
						type:             "bool"
						description:      "Whether or not organization members can create new internal repositories. For Enterprise Organizations only."
						description_kind: "plain"
						optional:         true
					}
					members_can_create_pages: {
						type:             "bool"
						description:      "Whether or not organization members can create new pages."
						description_kind: "plain"
						optional:         true
					}
					members_can_create_private_pages: {
						type:             "bool"
						description:      "Whether or not organization members can create new private pages."
						description_kind: "plain"
						optional:         true
					}
					members_can_create_private_repositories: {
						type:             "bool"
						description:      "Whether or not organization members can create new private repositories."
						description_kind: "plain"
						optional:         true
					}
					members_can_create_public_pages: {
						type:             "bool"
						description:      "Whether or not organization members can create new public pages."
						description_kind: "plain"
						optional:         true
					}
					members_can_create_public_repositories: {
						type:             "bool"
						description:      "Whether or not organization members can create new public repositories."
						description_kind: "plain"
						optional:         true
					}
					members_can_create_repositories: {
						type:             "bool"
						description:      "Whether or not organization members can create new repositories."
						description_kind: "plain"
						optional:         true
					}
					members_can_fork_private_repositories: {
						type:             "bool"
						description:      "Whether or not organization members can fork private repositories."
						description_kind: "plain"
						optional:         true
					}
					name: {
						type:             "string"
						description:      "The name for the organization."
						description_kind: "plain"
						optional:         true
					}
					secret_scanning_enabled_for_new_repositories: {
						type:             "bool"
						description:      "Whether or not secret scanning is enabled for new repositories."
						description_kind: "plain"
						optional:         true
					}
					secret_scanning_push_protection_enabled_for_new_repositories: {
						type:             "bool"
						description:      "Whether or not secret scanning push protection is enabled for new repositories."
						description_kind: "plain"
						optional:         true
					}
					twitter_username: {
						type:             "string"
						description:      "The Twitter username for the organization."
						description_kind: "plain"
						optional:         true
					}
					web_commit_signoff_required: {
						type:             "bool"
						description:      "Whether or not commit signatures are required for commits to the organization."
						description_kind: "plain"
						optional:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_organization_webhook: {
			version: 1
			block: {
				attributes: {
					active: {
						type:             "bool"
						description:      "Indicate if the webhook should receive events."
						description_kind: "plain"
						optional:         true
					}
					etag: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					events: {
						type: ["set", "string"]
						description:      "A list of events which should trigger the webhook."
						description_kind: "plain"
						required:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					url: {
						type:             "string"
						description:      "URL of the webhook."
						description_kind: "plain"
						computed:         true
					}
				}
				block_types: configuration: {
					nesting_mode: "list"
					block: {
						attributes: {
							content_type: {
								type:             "string"
								description:      "The content type for the payload. Valid values are either 'form' or 'json'."
								description_kind: "plain"
								optional:         true
							}
							insecure_ssl: {
								type:             "bool"
								description:      "Insecure SSL boolean toggle. Defaults to 'false'."
								description_kind: "plain"
								optional:         true
							}
							secret: {
								type:             "string"
								description:      "The shared secret for the webhook"
								description_kind: "plain"
								optional:         true
								sensitive:        true
							}
							url: {
								type:             "string"
								description:      "The URL of the webhook."
								description_kind: "plain"
								required:         true
								sensitive:        true
							}
						}
						description:      "Configuration for the webhook."
						description_kind: "plain"
					}
					max_items: 1
				}
				description_kind: "plain"
			}
		}
		github_project_card: {
			version: 0
			block: {
				attributes: {
					card_id: {
						type:             "number"
						description:      "The ID of the card."
						description_kind: "plain"
						computed:         true
					}
					column_id: {
						type:             "string"
						description:      "The ID of the project column."
						description_kind: "plain"
						required:         true
					}
					content_id: {
						type:             "number"
						description:      "'github_issue.issue_id'."
						description_kind: "plain"
						optional:         true
					}
					content_type: {
						type:             "string"
						description:      "Must be either 'Issue' or 'PullRequest'."
						description_kind: "plain"
						optional:         true
					}
					etag: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					note: {
						type:             "string"
						description:      "The note contents of the card. Markdown supported."
						description_kind: "plain"
						optional:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_project_column: {
			version: 0
			block: {
				attributes: {
					column_id: {
						type:             "number"
						description:      "The ID of the column."
						description_kind: "plain"
						computed:         true
					}
					etag: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					name: {
						type:             "string"
						description:      "The name of the column."
						description_kind: "plain"
						required:         true
					}
					project_id: {
						type:             "string"
						description:      "The ID of an existing project that the column will be created in."
						description_kind: "plain"
						required:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_release: {
			version: 0
			block: {
				attributes: {
					assets_url: {
						type:             "string"
						description:      "The URL for the release assets."
						description_kind: "plain"
						computed:         true
					}
					body: {
						type:             "string"
						description:      "Text describing the contents of the tag."
						description_kind: "plain"
						optional:         true
					}
					created_at: {
						type:             "string"
						description:      "The date and time the release was created."
						description_kind: "plain"
						computed:         true
					}
					discussion_category_name: {
						type:             "string"
						description:      "If specified, a discussion of the specified category is created and linked to the release. The value must be a category that already exists in the repository."
						description_kind: "plain"
						optional:         true
					}
					draft: {
						type:             "bool"
						description:      "Set to 'false' to create a published release."
						description_kind: "plain"
						optional:         true
					}
					etag: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					generate_release_notes: {
						type:             "bool"
						description:      "Set to 'true' to automatically generate the name and body for this release. If 'name' is specified, the specified name will be used; otherwise, a name will be automatically generated. If 'body' is specified, the body will be pre-pended to the automatically generated notes."
						description_kind: "plain"
						optional:         true
					}
					html_url: {
						type:             "string"
						description:      "The HTML URL for the release."
						description_kind: "plain"
						computed:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					name: {
						type:             "string"
						description:      "The name of the release."
						description_kind: "plain"
						optional:         true
					}
					node_id: {
						type:             "string"
						description:      "The node ID of the release."
						description_kind: "plain"
						computed:         true
					}
					prerelease: {
						type:             "bool"
						description:      "Set to 'false' to identify the release as a full release."
						description_kind: "plain"
						optional:         true
					}
					published_at: {
						type:             "string"
						description:      "The date and time the release was published."
						description_kind: "plain"
						computed:         true
					}
					release_id: {
						type:             "number"
						description:      "The ID of the release."
						description_kind: "plain"
						computed:         true
					}
					repository: {
						type:             "string"
						description:      "The name of the repository."
						description_kind: "plain"
						required:         true
					}
					tag_name: {
						type:             "string"
						description:      "The name of the tag."
						description_kind: "plain"
						required:         true
					}
					tarball_url: {
						type:             "string"
						description:      "The URL for the tarball of the release."
						description_kind: "plain"
						computed:         true
					}
					target_commitish: {
						type:             "string"
						description:      " The branch name or commit SHA the tag is created from."
						description_kind: "plain"
						optional:         true
					}
					upload_url: {
						type:             "string"
						description:      "The URL for the uploaded assets of release."
						description_kind: "plain"
						computed:         true
					}
					url: {
						type:             "string"
						description:      "The URL for the release."
						description_kind: "plain"
						computed:         true
					}
					zipball_url: {
						type:             "string"
						description:      "The URL for the zipball of the release."
						description_kind: "plain"
						computed:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_repository: {
			version: 1
			block: {
				attributes: {
					allow_auto_merge: {
						type:             "bool"
						description:      "Set to 'true' to allow auto-merging pull requests on the repository."
						description_kind: "plain"
						optional:         true
					}
					allow_merge_commit: {
						type:             "bool"
						description:      "Set to 'false' to disable merge commits on the repository."
						description_kind: "plain"
						optional:         true
					}
					allow_rebase_merge: {
						type:             "bool"
						description:      "Set to 'false' to disable rebase merges on the repository."
						description_kind: "plain"
						optional:         true
					}
					allow_squash_merge: {
						type:             "bool"
						description:      "Set to 'false' to disable squash merges on the repository."
						description_kind: "plain"
						optional:         true
					}
					allow_update_branch: {
						type:             "bool"
						description:      " Set to 'true' to always suggest updating pull request branches."
						description_kind: "plain"
						optional:         true
					}
					archive_on_destroy: {
						type:             "bool"
						description:      "Set to 'true' to archive the repository instead of deleting on destroy."
						description_kind: "plain"
						optional:         true
					}
					archived: {
						type:             "bool"
						description:      "Specifies if the repository should be archived. Defaults to 'false'. NOTE Currently, the API does not support unarchiving."
						description_kind: "plain"
						optional:         true
					}
					auto_init: {
						type:             "bool"
						description:      "Set to 'true' to produce an initial commit in the repository."
						description_kind: "plain"
						optional:         true
					}
					default_branch: {
						type:             "string"
						description:      "Can only be set after initial repository creation, and only if the target branch exists"
						description_kind: "plain"
						deprecated:       true
						optional:         true
						computed:         true
					}
					delete_branch_on_merge: {
						type:             "bool"
						description:      "Automatically delete head branch after a pull request is merged. Defaults to 'false'."
						description_kind: "plain"
						optional:         true
					}
					description: {
						type:             "string"
						description:      "A description of the repository."
						description_kind: "plain"
						optional:         true
					}
					etag: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					full_name: {
						type:             "string"
						description:      "A string of the form 'orgname/reponame'."
						description_kind: "plain"
						computed:         true
					}
					git_clone_url: {
						type:             "string"
						description:      "URL that can be provided to 'git clone' to clone the repository anonymously via the git protocol."
						description_kind: "plain"
						computed:         true
					}
					gitignore_template: {
						type:             "string"
						description:      "Use the name of the template without the extension. For example, 'Haskell'."
						description_kind: "plain"
						optional:         true
					}
					has_discussions: {
						type:             "bool"
						description:      "Set to 'true' to enable GitHub Discussions on the repository. Defaults to 'false'."
						description_kind: "plain"
						optional:         true
					}
					has_downloads: {
						type:             "bool"
						description:      "Set to 'true' to enable the (deprecated) downloads features on the repository."
						description_kind: "plain"
						optional:         true
					}
					has_issues: {
						type:             "bool"
						description:      "Set to 'true' to enable the GitHub Issues features on the repository"
						description_kind: "plain"
						optional:         true
					}
					has_projects: {
						type:             "bool"
						description:      "Set to 'true' to enable the GitHub Projects features on the repository. Per the GitHub documentation when in an organization that has disabled repository projects it will default to 'false' and will otherwise default to 'true'. If you specify 'true' when it has been disabled it will return an error."
						description_kind: "plain"
						optional:         true
					}
					has_wiki: {
						type:             "bool"
						description:      "Set to 'true' to enable the GitHub Wiki features on the repository."
						description_kind: "plain"
						optional:         true
					}
					homepage_url: {
						type:             "string"
						description:      "URL of a page describing the project."
						description_kind: "plain"
						optional:         true
					}
					html_url: {
						type:             "string"
						description:      "URL to the repository on the web."
						description_kind: "plain"
						computed:         true
					}
					http_clone_url: {
						type:             "string"
						description:      "URL that can be provided to 'git clone' to clone the repository via HTTPS."
						description_kind: "plain"
						computed:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					ignore_vulnerability_alerts_during_read: {
						type:             "bool"
						description:      "Set to true to not call the vulnerability alerts endpoint so the resource can also be used without admin permissions during read."
						description_kind: "plain"
						optional:         true
					}
					is_template: {
						type:             "bool"
						description:      "Set to 'true' to tell GitHub that this is a template repository."
						description_kind: "plain"
						optional:         true
					}
					license_template: {
						type:             "string"
						description:      "Use the name of the template without the extension. For example, 'mit' or 'mpl-2.0'."
						description_kind: "plain"
						optional:         true
					}
					merge_commit_message: {
						type:             "string"
						description:      "Can be 'PR_BODY', 'PR_TITLE', or 'BLANK' for a default merge commit message."
						description_kind: "plain"
						optional:         true
					}
					merge_commit_title: {
						type:             "string"
						description:      "Can be 'PR_TITLE' or 'MERGE_MESSAGE' for a default merge commit title."
						description_kind: "plain"
						optional:         true
					}
					name: {
						type:             "string"
						description:      "The name of the repository."
						description_kind: "plain"
						required:         true
					}
					node_id: {
						type:             "string"
						description:      "GraphQL global node id for use with v4 API."
						description_kind: "plain"
						computed:         true
					}
					primary_language: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					private: {
						type:             "bool"
						description_kind: "plain"
						deprecated:       true
						optional:         true
						computed:         true
					}
					repo_id: {
						type:             "number"
						description:      "GitHub ID for the repository."
						description_kind: "plain"
						computed:         true
					}
					squash_merge_commit_message: {
						type:             "string"
						description:      "Can be 'PR_BODY', 'COMMIT_MESSAGES', or 'BLANK' for a default squash merge commit message."
						description_kind: "plain"
						optional:         true
					}
					squash_merge_commit_title: {
						type:             "string"
						description:      "Can be 'PR_TITLE' or 'COMMIT_OR_PR_TITLE' for a default squash merge commit title."
						description_kind: "plain"
						optional:         true
					}
					ssh_clone_url: {
						type:             "string"
						description:      "URL that can be provided to 'git clone' to clone the repository via SSH."
						description_kind: "plain"
						computed:         true
					}
					svn_url: {
						type:             "string"
						description:      "URL that can be provided to 'svn checkout' to check out the repository via GitHub's Subversion protocol emulation."
						description_kind: "plain"
						computed:         true
					}
					topics: {
						type: ["set", "string"]
						description:      "The list of topics of the repository."
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					visibility: {
						type:             "string"
						description:      "Can be 'public' or 'private'. If your organization is associated with an enterprise account using GitHub Enterprise Cloud or GitHub Enterprise Server 2.20+, visibility can also be 'internal'."
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					vulnerability_alerts: {
						type:             "bool"
						description:      "Set to 'true' to enable security alerts for vulnerable dependencies. Enabling requires alerts to be enabled on the owner level. (Note for importing: GitHub enables the alerts on public repos but disables them on private repos by default). Note that vulnerability alerts have not been successfully tested on any GitHub Enterprise instance and may be unavailable in those settings."
						description_kind: "plain"
						optional:         true
					}
					web_commit_signoff_required: {
						type:             "bool"
						description:      "Require contributors to sign off on web-based commits. Defaults to 'false'."
						description_kind: "plain"
						optional:         true
					}
				}
				block_types: {
					pages: {
						nesting_mode: "list"
						block: {
							attributes: {
								build_type: {
									type:             "string"
									description:      "The type the page should be sourced."
									description_kind: "plain"
									optional:         true
								}
								cname: {
									type:             "string"
									description:      "The custom domain for the repository. This can only be set after the repository has been created."
									description_kind: "plain"
									optional:         true
								}
								custom_404: {
									type:             "bool"
									description:      "Whether the rendered GitHub Pages site has a custom 404 page"
									description_kind: "plain"
									computed:         true
								}
								html_url: {
									type:             "string"
									description:      "URL to the repository on the web."
									description_kind: "plain"
									computed:         true
								}
								status: {
									type:             "string"
									description:      "The GitHub Pages site's build status e.g. building or built."
									description_kind: "plain"
									computed:         true
								}
								url: {
									type:             "string"
									description_kind: "plain"
									computed:         true
								}
							}
							block_types: source: {
								nesting_mode: "list"
								block: {
									attributes: {
										branch: {
											type:             "string"
											description:      "The repository branch used to publish the site's source files. (i.e. 'main' or 'gh-pages')"
											description_kind: "plain"
											required:         true
										}
										path: {
											type:             "string"
											description:      "The repository directory from which the site publishes (Default: '/')"
											description_kind: "plain"
											optional:         true
										}
									}
									description:      "The source branch and directory for the rendered Pages site."
									description_kind: "plain"
								}
								max_items: 1
							}
							description:      "The repository's GitHub Pages configuration"
							description_kind: "plain"
						}
						max_items: 1
					}
					security_and_analysis: {
						nesting_mode: "list"
						block: {
							block_types: {
								advanced_security: {
									nesting_mode: "list"
									block: {
										attributes: status: {
											type:             "string"
											description:      "Set to 'enabled' to enable advanced security features on the repository. Can be 'enabled' or 'disabled'."
											description_kind: "plain"
											required:         true
										}
										description:      "The advanced security configuration for the repository. If a repository's visibility is 'public', advanced security is always enabled and cannot be changed, so this setting cannot be supplied."
										description_kind: "plain"
									}
									max_items: 1
								}
								secret_scanning: {
									nesting_mode: "list"
									block: {
										attributes: status: {
											type:             "string"
											description:      "Set to 'enabled' to enable secret scanning on the repository. Can be 'enabled' or 'disabled'. If set to 'enabled', the repository's visibility must be 'public' or 'security_and_analysis[0].advanced_security[0].status' must also be set to 'enabled'."
											description_kind: "plain"
											required:         true
										}
										description:      "The secret scanning configuration for the repository."
										description_kind: "plain"
									}
									max_items: 1
								}
								secret_scanning_push_protection: {
									nesting_mode: "list"
									block: {
										attributes: status: {
											type:             "string"
											description:      "Set to 'enabled' to enable secret scanning push protection on the repository. Can be 'enabled' or 'disabled'. If set to 'enabled', the repository's visibility must be 'public' or 'security_and_analysis[0].advanced_security[0].status' must also be set to 'enabled'."
											description_kind: "plain"
											required:         true
										}
										description:      "The secret scanning push protection configuration for the repository."
										description_kind: "plain"
									}
									max_items: 1
								}
							}
							description:      "Security and analysis settings for the repository. To use this parameter you must have admin permissions for the repository or be an owner or security manager for the organization that owns the repository."
							description_kind: "plain"
						}
						max_items: 1
					}
					template: {
						nesting_mode: "list"
						block: {
							attributes: {
								include_all_branches: {
									type:             "bool"
									description:      "Whether the new repository should include all the branches from the template repository (defaults to 'false', which includes only the default branch from the template)."
									description_kind: "plain"
									optional:         true
								}
								owner: {
									type:             "string"
									description:      "The GitHub organization or user the template repository is owned by."
									description_kind: "plain"
									required:         true
								}
								repository: {
									type:             "string"
									description:      "The name of the template repository."
									description_kind: "plain"
									required:         true
								}
							}
							description:      "Use a template repository to create this resource."
							description_kind: "plain"
						}
						max_items: 1
					}
				}
				description_kind: "plain"
			}
		}
		github_repository_autolink_reference: {
			version: 1
			block: {
				attributes: {
					etag: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					is_alphanumeric: {
						type:             "bool"
						description:      "Whether this autolink reference matches alphanumeric characters. If false, this autolink reference only matches numeric characters."
						description_kind: "plain"
						optional:         true
					}
					key_prefix: {
						type:             "string"
						description:      "This prefix appended by a number will generate a link any time it is found in an issue, pull request, or commit"
						description_kind: "plain"
						required:         true
					}
					repository: {
						type:             "string"
						description:      "The repository name"
						description_kind: "plain"
						required:         true
					}
					target_url_template: {
						type:             "string"
						description:      "The template of the target URL used for the links; must be a valid URL and contain `<num>` for the reference number"
						description_kind: "plain"
						required:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_repository_collaborator: {
			version: 0
			block: {
				attributes: {
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					invitation_id: {
						type:             "string"
						description:      "ID of the invitation to be used in 'github_user_invitation_accepter'"
						description_kind: "plain"
						computed:         true
					}
					permission: {
						type:             "string"
						description:      "The permission of the outside collaborator for the repository. Must be one of 'pull', 'push', 'maintain', 'triage' or 'admin' or the name of an existing custom repository role within the organization for organization-owned repositories. Must be 'push' for personal repositories. Defaults to 'push'."
						description_kind: "plain"
						optional:         true
					}
					permission_diff_suppression: {
						type:             "bool"
						description:      "Suppress plan diffs for triage and maintain. Defaults to 'false'."
						description_kind: "plain"
						optional:         true
					}
					repository: {
						type:             "string"
						description:      "The GitHub repository"
						description_kind: "plain"
						required:         true
					}
					username: {
						type:             "string"
						description:      "The user to add to the repository as a collaborator."
						description_kind: "plain"
						required:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_repository_collaborators: {
			version: 0
			block: {
				attributes: {
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					invitation_ids: {
						type: ["map", "string"]
						description:      "Map of usernames to invitation ID for any users added"
						description_kind: "plain"
						computed:         true
					}
					repository: {
						type:             "string"
						description_kind: "plain"
						required:         true
					}
				}
				block_types: {
					team: {
						nesting_mode: "set"
						block: {
							attributes: {
								permission: {
									type:             "string"
									description_kind: "plain"
									optional:         true
								}
								team_id: {
									type:             "string"
									description:      "Team ID or slug to add to the repository as a collaborator."
									description_kind: "plain"
									required:         true
								}
							}
							description:      "List of teams"
							description_kind: "plain"
						}
					}
					user: {
						nesting_mode: "set"
						block: {
							attributes: {
								permission: {
									type:             "string"
									description_kind: "plain"
									optional:         true
								}
								username: {
									type:             "string"
									description:      "(Required) The user to add to the repository as a collaborator."
									description_kind: "plain"
									required:         true
								}
							}
							description:      "List of users"
							description_kind: "plain"
						}
					}
				}
				description_kind: "plain"
			}
		}
		github_repository_dependabot_security_updates: {
			version: 0
			block: {
				attributes: {
					enabled: {
						type:             "bool"
						description:      "The state of the automated security fixes."
						description_kind: "plain"
						required:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					repository: {
						type:             "string"
						description:      "The GitHub repository."
						description_kind: "plain"
						required:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_repository_deploy_key: {
			version: 0
			block: {
				attributes: {
					etag: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					key: {
						type:             "string"
						description:      "A SSH key."
						description_kind: "plain"
						required:         true
					}
					read_only: {
						type:             "bool"
						description:      "A boolean qualifying the key to be either read only or read/write."
						description_kind: "plain"
						optional:         true
					}
					repository: {
						type:             "string"
						description:      "Name of the GitHub repository."
						description_kind: "plain"
						required:         true
					}
					title: {
						type:             "string"
						description:      "A title."
						description_kind: "plain"
						required:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_repository_deployment_branch_policy: {
			version: 0
			block: {
				attributes: {
					environment_name: {
						type:             "string"
						description:      "The target environment name."
						description_kind: "plain"
						required:         true
					}
					etag: {
						type:             "string"
						description:      "An etag representing the Branch object."
						description_kind: "plain"
						computed:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					name: {
						type:             "string"
						description:      "The name of the branch"
						description_kind: "plain"
						required:         true
					}
					repository: {
						type:             "string"
						description:      "The GitHub repository name."
						description_kind: "plain"
						required:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_repository_environment: {
			version: 0
			block: {
				attributes: {
					can_admins_bypass: {
						type:             "bool"
						description:      "Can Admins bypass deployment protections"
						description_kind: "plain"
						optional:         true
					}
					environment: {
						type:             "string"
						description:      "The name of the environment."
						description_kind: "plain"
						required:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					prevent_self_review: {
						type:             "bool"
						description:      "Prevent users from approving workflows runs that they triggered."
						description_kind: "plain"
						optional:         true
					}
					repository: {
						type:             "string"
						description:      "The repository of the environment."
						description_kind: "plain"
						required:         true
					}
					wait_timer: {
						type:             "number"
						description:      "Amount of time to delay a job after the job is initially triggered."
						description_kind: "plain"
						optional:         true
					}
				}
				block_types: {
					deployment_branch_policy: {
						nesting_mode: "list"
						block: {
							attributes: {
								custom_branch_policies: {
									type:             "bool"
									description:      "Whether only branches that match the specified name patterns can deploy to this environment."
									description_kind: "plain"
									required:         true
								}
								protected_branches: {
									type:             "bool"
									description:      "Whether only branches with branch protection rules can deploy to this environment."
									description_kind: "plain"
									required:         true
								}
							}
							description:      "The deployment branch policy configuration"
							description_kind: "plain"
						}
						max_items: 1
					}
					reviewers: {
						nesting_mode: "list"
						block: {
							attributes: {
								teams: {
									type: ["set", "number"]
									description:      "Up to 6 IDs for teams who may review jobs that reference the environment. Reviewers must have at least read access to the repository. Only one of the required reviewers needs to approve the job for it to proceed."
									description_kind: "plain"
									optional:         true
								}
								users: {
									type: ["set", "number"]
									description:      "Up to 6 IDs for users who may review jobs that reference the environment. Reviewers must have at least read access to the repository. Only one of the required reviewers needs to approve the job for it to proceed."
									description_kind: "plain"
									optional:         true
								}
							}
							description:      "The environment reviewers configuration."
							description_kind: "plain"
						}
						max_items: 6
					}
				}
				description_kind: "plain"
			}
		}
		github_repository_environment_deployment_policy: {
			version: 0
			block: {
				attributes: {
					branch_pattern: {
						type:             "string"
						description:      "The name pattern that branches must match in order to deploy to the environment."
						description_kind: "plain"
						required:         true
					}
					environment: {
						type:             "string"
						description:      "The name of the environment."
						description_kind: "plain"
						required:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					repository: {
						type:             "string"
						description:      "The name of the repository. The name is not case sensitive."
						description_kind: "plain"
						required:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_repository_file: {
			version: 0
			block: {
				attributes: {
					branch: {
						type:             "string"
						description:      "The branch name, defaults to the repository's default branch"
						description_kind: "plain"
						optional:         true
					}
					commit_author: {
						type:             "string"
						description:      "The commit author name, defaults to the authenticated user's name. GitHub app users may omit author and email information so GitHub can verify commits as the GitHub App. "
						description_kind: "plain"
						optional:         true
					}
					commit_email: {
						type:             "string"
						description:      "The commit author email address, defaults to the authenticated user's email address. GitHub app users may omit author and email information so GitHub can verify commits as the GitHub App."
						description_kind: "plain"
						optional:         true
					}
					commit_message: {
						type:             "string"
						description:      "The commit message when creating, updating or deleting the file"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					commit_sha: {
						type:             "string"
						description:      "The SHA of the commit that modified the file"
						description_kind: "plain"
						computed:         true
					}
					content: {
						type:             "string"
						description:      "The file's content"
						description_kind: "plain"
						required:         true
					}
					file: {
						type:             "string"
						description:      "The file path to manage"
						description_kind: "plain"
						required:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					overwrite_on_create: {
						type:             "bool"
						description:      "Enable overwriting existing files, defaults to \"false\""
						description_kind: "plain"
						optional:         true
					}
					ref: {
						type:             "string"
						description:      "The name of the commit/branch/tag"
						description_kind: "plain"
						computed:         true
					}
					repository: {
						type:             "string"
						description:      "The repository name"
						description_kind: "plain"
						required:         true
					}
					sha: {
						type:             "string"
						description:      "The blob SHA of the file"
						description_kind: "plain"
						computed:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_repository_milestone: {
			version: 0
			block: {
				attributes: {
					description: {
						type:             "string"
						description:      "A description of the milestone."
						description_kind: "plain"
						optional:         true
					}
					due_date: {
						type:             "string"
						description:      "The milestone due date. In 'yyyy-mm-dd' format."
						description_kind: "plain"
						optional:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					number: {
						type:             "number"
						description:      "The number of the milestone."
						description_kind: "plain"
						computed:         true
					}
					owner: {
						type:             "string"
						description:      "The owner of the GitHub Repository."
						description_kind: "plain"
						required:         true
					}
					repository: {
						type:             "string"
						description:      "The name of the GitHub Repository."
						description_kind: "plain"
						required:         true
					}
					state: {
						type:             "string"
						description:      "The state of the milestone. Either 'open' or 'closed'. Default: 'open'."
						description_kind: "plain"
						optional:         true
					}
					title: {
						type:             "string"
						description:      "The title of the milestone."
						description_kind: "plain"
						required:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_repository_project: {
			version: 0
			block: {
				attributes: {
					body: {
						type:             "string"
						description:      "The body of the project."
						description_kind: "plain"
						optional:         true
					}
					etag: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					name: {
						type:             "string"
						description:      "The name of the project."
						description_kind: "plain"
						required:         true
					}
					repository: {
						type:             "string"
						description:      "The repository of the project."
						description_kind: "plain"
						required:         true
					}
					url: {
						type:             "string"
						description:      "URL of the project"
						description_kind: "plain"
						computed:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_repository_pull_request: {
			version: 0
			block: {
				attributes: {
					base_ref: {
						type:             "string"
						description:      "Name of the branch serving as the base of the Pull Request."
						description_kind: "plain"
						required:         true
					}
					base_repository: {
						type:             "string"
						description:      "Name of the base repository to retrieve the Pull Requests from."
						description_kind: "plain"
						required:         true
					}
					base_sha: {
						type:             "string"
						description:      "Head commit SHA of the Pull Request base."
						description_kind: "plain"
						computed:         true
					}
					body: {
						type:             "string"
						description:      "Body of the Pull Request."
						description_kind: "plain"
						optional:         true
					}
					draft: {
						type:             "bool"
						description:      "Indicates Whether this Pull Request is a draft."
						description_kind: "plain"
						computed:         true
					}
					head_ref: {
						type:             "string"
						description:      "Name of the branch serving as the head of the Pull Request."
						description_kind: "plain"
						required:         true
					}
					head_sha: {
						type:             "string"
						description:      "Head commit SHA of the Pull Request head."
						description_kind: "plain"
						computed:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					labels: {
						type: ["list", "string"]
						description:      "List of names of labels on the PR"
						description_kind: "plain"
						computed:         true
					}
					maintainer_can_modify: {
						type:             "bool"
						description:      "Controls whether the base repository maintainers can modify the Pull Request. Default: 'false'."
						description_kind: "plain"
						optional:         true
					}
					number: {
						type:             "number"
						description:      "The number of the Pull Request within the repository."
						description_kind: "plain"
						computed:         true
					}
					opened_at: {
						type:             "number"
						description:      "Unix timestamp indicating the Pull Request creation time."
						description_kind: "plain"
						computed:         true
					}
					opened_by: {
						type:             "string"
						description:      "Username of the PR creator"
						description_kind: "plain"
						computed:         true
					}
					owner: {
						type:             "string"
						description:      "Owner of the repository. If not provided, the provider's default owner is used."
						description_kind: "plain"
						optional:         true
					}
					state: {
						type:             "string"
						description:      "The current Pull Request state - can be 'open', 'closed' or 'merged'."
						description_kind: "plain"
						computed:         true
					}
					title: {
						type:             "string"
						description:      "The title of the Pull Request."
						description_kind: "plain"
						required:         true
					}
					updated_at: {
						type:             "number"
						description:      "The timestamp of the last Pull Request update."
						description_kind: "plain"
						computed:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_repository_ruleset: {
			version: 1
			block: {
				attributes: {
					enforcement: {
						type:             "string"
						description:      "Possible values for Enforcement are `disabled`, `active`, `evaluate`. Note: `evaluate` is currently only supported for owners of type `organization`."
						description_kind: "plain"
						required:         true
					}
					etag: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					name: {
						type:             "string"
						description:      "The name of the ruleset."
						description_kind: "plain"
						required:         true
					}
					node_id: {
						type:             "string"
						description:      "GraphQL global node id for use with v4 API."
						description_kind: "plain"
						computed:         true
					}
					repository: {
						type:             "string"
						description:      "Name of the repository to apply rulset to."
						description_kind: "plain"
						optional:         true
					}
					ruleset_id: {
						type:             "number"
						description:      "GitHub ID for the ruleset."
						description_kind: "plain"
						computed:         true
					}
					target: {
						type:             "string"
						description:      "Possible values are `branch` and `tag`."
						description_kind: "plain"
						required:         true
					}
				}
				block_types: {
					bypass_actors: {
						nesting_mode: "list"
						block: {
							attributes: {
								actor_id: {
									type:             "number"
									description:      "The ID of the actor that can bypass a ruleset. When `actor_type` is `OrganizationAdmin`, this should be set to `1`."
									description_kind: "plain"
									required:         true
								}
								actor_type: {
									type:             "string"
									description:      "The type of actor that can bypass a ruleset. Can be one of: `RepositoryRole`, `Team`, `Integration`, `OrganizationAdmin`."
									description_kind: "plain"
									required:         true
								}
								bypass_mode: {
									type:             "string"
									description:      "When the specified actor can bypass the ruleset. pull_request means that an actor can only bypass rules on pull requests. Can be one of: `always`, `pull_request`."
									description_kind: "plain"
									required:         true
								}
							}
							description:      "The actors that can bypass the rules in this ruleset."
							description_kind: "plain"
						}
					}
					conditions: {
						nesting_mode: "list"
						block: {
							block_types: ref_name: {
								nesting_mode: "list"
								block: {
									attributes: {
										exclude: {
											type: ["list", "string"]
											description:      "Array of ref names or patterns to exclude. The condition will not pass if any of these patterns match."
											description_kind: "plain"
											required:         true
										}
										include: {
											type: ["list", "string"]
											description:      "Array of ref names or patterns to include. One of these patterns must match for the condition to pass. Also accepts `~DEFAULT_BRANCH` to include the default branch or `~ALL` to include all branches."
											description_kind: "plain"
											required:         true
										}
									}
									description_kind: "plain"
								}
								min_items: 1
								max_items: 1
							}
							description:      "Parameters for a repository ruleset ref name condition."
							description_kind: "plain"
						}
						max_items: 1
					}
					rules: {
						nesting_mode: "list"
						block: {
							attributes: {
								creation: {
									type:             "bool"
									description:      "Only allow users with bypass permission to create matching refs."
									description_kind: "plain"
									optional:         true
								}
								deletion: {
									type:             "bool"
									description:      "Only allow users with bypass permissions to delete matching refs."
									description_kind: "plain"
									optional:         true
								}
								non_fast_forward: {
									type:             "bool"
									description:      "Prevent users with push access from force pushing to branches."
									description_kind: "plain"
									optional:         true
								}
								required_linear_history: {
									type:             "bool"
									description:      "Prevent merge commits from being pushed to matching branches."
									description_kind: "plain"
									optional:         true
								}
								required_signatures: {
									type:             "bool"
									description:      "Commits pushed to matching branches must have verified signatures."
									description_kind: "plain"
									optional:         true
								}
								update: {
									type:             "bool"
									description:      "Only allow users with bypass permission to update matching refs."
									description_kind: "plain"
									optional:         true
								}
								update_allows_fetch_and_merge: {
									type:             "bool"
									description:      "Branch can pull changes from its upstream repository. This is only applicable to forked repositories. Requires `update` to be set to `true`."
									description_kind: "plain"
									optional:         true
								}
							}
							block_types: {
								branch_name_pattern: {
									nesting_mode: "list"
									block: {
										attributes: {
											name: {
												type:             "string"
												description:      "How this rule will appear to users."
												description_kind: "plain"
												optional:         true
											}
											negate: {
												type:             "bool"
												description:      "If true, the rule will fail if the pattern matches."
												description_kind: "plain"
												optional:         true
											}
											operator: {
												type:             "string"
												description:      "The operator to use for matching. Can be one of: `starts_with`, `ends_with`, `contains`, `regex`."
												description_kind: "plain"
												required:         true
											}
											pattern: {
												type:             "string"
												description:      "The pattern to match with."
												description_kind: "plain"
												required:         true
											}
										}
										description:      "Parameters to be used for the branch_name_pattern rule. This rule only applies to repositories within an enterprise, it cannot be applied to repositories owned by individuals or regular organizations. Conflicts with `tag_name_pattern` as it only applies to rulesets with target `branch`."
										description_kind: "plain"
									}
									max_items: 1
								}
								commit_author_email_pattern: {
									nesting_mode: "list"
									block: {
										attributes: {
											name: {
												type:             "string"
												description:      "How this rule will appear to users."
												description_kind: "plain"
												optional:         true
											}
											negate: {
												type:             "bool"
												description:      "If true, the rule will fail if the pattern matches."
												description_kind: "plain"
												optional:         true
											}
											operator: {
												type:             "string"
												description:      "The operator to use for matching. Can be one of: `starts_with`, `ends_with`, `contains`, `regex`."
												description_kind: "plain"
												required:         true
											}
											pattern: {
												type:             "string"
												description:      "The pattern to match with."
												description_kind: "plain"
												required:         true
											}
										}
										description:      "Parameters to be used for the commit_author_email_pattern rule. This rule only applies to repositories within an enterprise, it cannot be applied to repositories owned by individuals or regular organizations."
										description_kind: "plain"
									}
									max_items: 1
								}
								commit_message_pattern: {
									nesting_mode: "list"
									block: {
										attributes: {
											name: {
												type:             "string"
												description:      "How this rule will appear to users."
												description_kind: "plain"
												optional:         true
											}
											negate: {
												type:             "bool"
												description:      "If true, the rule will fail if the pattern matches."
												description_kind: "plain"
												optional:         true
											}
											operator: {
												type:             "string"
												description:      "The operator to use for matching. Can be one of: `starts_with`, `ends_with`, `contains`, `regex`."
												description_kind: "plain"
												required:         true
											}
											pattern: {
												type:             "string"
												description:      "The pattern to match with."
												description_kind: "plain"
												required:         true
											}
										}
										description:      "Parameters to be used for the commit_message_pattern rule. This rule only applies to repositories within an enterprise, it cannot be applied to repositories owned by individuals or regular organizations."
										description_kind: "plain"
									}
									max_items: 1
								}
								committer_email_pattern: {
									nesting_mode: "list"
									block: {
										attributes: {
											name: {
												type:             "string"
												description:      "How this rule will appear to users."
												description_kind: "plain"
												optional:         true
											}
											negate: {
												type:             "bool"
												description:      "If true, the rule will fail if the pattern matches."
												description_kind: "plain"
												optional:         true
											}
											operator: {
												type:             "string"
												description:      "The operator to use for matching. Can be one of: `starts_with`, `ends_with`, `contains`, `regex`."
												description_kind: "plain"
												required:         true
											}
											pattern: {
												type:             "string"
												description:      "The pattern to match with."
												description_kind: "plain"
												required:         true
											}
										}
										description:      "Parameters to be used for the committer_email_pattern rule. This rule only applies to repositories within an enterprise, it cannot be applied to repositories owned by individuals or regular organizations."
										description_kind: "plain"
									}
									max_items: 1
								}
								pull_request: {
									nesting_mode: "list"
									block: {
										attributes: {
											dismiss_stale_reviews_on_push: {
												type:             "bool"
												description:      "New, reviewable commits pushed will dismiss previous pull request review approvals. Defaults to `false`."
												description_kind: "plain"
												optional:         true
											}
											require_code_owner_review: {
												type:             "bool"
												description:      "Require an approving review in pull requests that modify files that have a designated code owner. Defaults to `false`."
												description_kind: "plain"
												optional:         true
											}
											require_last_push_approval: {
												type:             "bool"
												description:      "Whether the most recent reviewable push must be approved by someone other than the person who pushed it. Defaults to `false`."
												description_kind: "plain"
												optional:         true
											}
											required_approving_review_count: {
												type:             "number"
												description:      "The number of approving reviews that are required before a pull request can be merged. Defaults to `0`."
												description_kind: "plain"
												optional:         true
											}
											required_review_thread_resolution: {
												type:             "bool"
												description:      "All conversations on code must be resolved before a pull request can be merged. Defaults to `false`."
												description_kind: "plain"
												optional:         true
											}
										}
										description:      "Require all commits be made to a non-target branch and submitted via a pull request before they can be merged."
										description_kind: "plain"
									}
									max_items: 1
								}
								required_deployments: {
									nesting_mode: "list"
									block: {
										attributes: required_deployment_environments: {
											type: ["list", "string"]
											description:      "The environments that must be successfully deployed to before branches can be merged."
											description_kind: "plain"
											required:         true
										}
										description:      "Choose which environments must be successfully deployed to before branches can be merged into a branch that matches this rule."
										description_kind: "plain"
									}
									max_items: 1
								}
								required_status_checks: {
									nesting_mode: "list"
									block: {
										attributes: strict_required_status_checks_policy: {
											type:             "bool"
											description:      "Whether pull requests targeting a matching branch must be tested with the latest code. This setting will not take effect unless at least one status check is enabled. Defaults to `false`."
											description_kind: "plain"
											optional:         true
										}
										block_types: required_check: {
											nesting_mode: "set"
											block: {
												attributes: {
													context: {
														type:             "string"
														description:      "The status check context name that must be present on the commit."
														description_kind: "plain"
														required:         true
													}
													integration_id: {
														type:             "number"
														description:      "The optional integration ID that this status check must originate from."
														description_kind: "plain"
														optional:         true
													}
												}
												description:      "Status checks that are required. Several can be defined."
												description_kind: "plain"
											}
											min_items: 1
										}
										description:      "Choose which status checks must pass before branches can be merged into a branch that matches this rule. When enabled, commits must first be pushed to another branch, then merged or pushed directly to a branch that matches this rule after status checks have passed."
										description_kind: "plain"
									}
									max_items: 1
								}
								tag_name_pattern: {
									nesting_mode: "list"
									block: {
										attributes: {
											name: {
												type:             "string"
												description:      "How this rule will appear to users."
												description_kind: "plain"
												optional:         true
											}
											negate: {
												type:             "bool"
												description:      "If true, the rule will fail if the pattern matches."
												description_kind: "plain"
												optional:         true
											}
											operator: {
												type:             "string"
												description:      "The operator to use for matching. Can be one of: `starts_with`, `ends_with`, `contains`, `regex`."
												description_kind: "plain"
												required:         true
											}
											pattern: {
												type:             "string"
												description:      "The pattern to match with."
												description_kind: "plain"
												required:         true
											}
										}
										description:      "Parameters to be used for the tag_name_pattern rule. This rule only applies to repositories within an enterprise, it cannot be applied to repositories owned by individuals or regular organizations. Conflicts with `branch_name_pattern` as it only applies to rulesets with target `tag`."
										description_kind: "plain"
									}
									max_items: 1
								}
							}
							description:      "Rules within the ruleset."
							description_kind: "plain"
						}
						min_items: 1
						max_items: 1
					}
				}
				description_kind: "plain"
			}
		}
		github_repository_tag_protection: {
			version: 0
			block: {
				attributes: {
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					pattern: {
						type:             "string"
						description:      "The pattern of the tag to protect."
						description_kind: "plain"
						required:         true
					}
					repository: {
						type:             "string"
						description:      "Name of the repository to add the tag protection to."
						description_kind: "plain"
						required:         true
					}
					tag_protection_id: {
						type:             "number"
						description:      "The ID of the tag protection."
						description_kind: "plain"
						computed:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_repository_topics: {
			version: 0
			block: {
				attributes: {
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					repository: {
						type:             "string"
						description:      "The name of the repository. The name is not case sensitive."
						description_kind: "plain"
						required:         true
					}
					topics: {
						type: ["set", "string"]
						description:      "An array of topics to add to the repository. Pass one or more topics to replace the set of existing topics. Send an empty array ([]) to clear all topics from the repository. Note: Topic names cannot contain uppercase letters."
						description_kind: "plain"
						required:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_repository_webhook: {
			version: 1
			block: {
				attributes: {
					active: {
						type:             "bool"
						description:      "Indicate if the webhook should receive events. Defaults to 'true'."
						description_kind: "plain"
						optional:         true
					}
					etag: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					events: {
						type: ["set", "string"]
						description:      "A list of events which should trigger the webhook"
						description_kind: "plain"
						required:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					repository: {
						type:             "string"
						description:      "The repository of the webhook."
						description_kind: "plain"
						required:         true
					}
					url: {
						type:             "string"
						description:      "Configuration block for the webhook"
						description_kind: "plain"
						computed:         true
					}
				}
				block_types: configuration: {
					nesting_mode: "list"
					block: {
						attributes: {
							content_type: {
								type:             "string"
								description:      "The content type for the payload. Valid values are either 'form' or 'json'."
								description_kind: "plain"
								optional:         true
							}
							insecure_ssl: {
								type:             "bool"
								description:      "Insecure SSL boolean toggle. Defaults to 'false'."
								description_kind: "plain"
								optional:         true
							}
							secret: {
								type:             "string"
								description:      "The shared secret for the webhook"
								description_kind: "plain"
								optional:         true
								sensitive:        true
							}
							url: {
								type:             "string"
								description:      "The URL of the webhook."
								description_kind: "plain"
								required:         true
								sensitive:        true
							}
						}
						description:      "Configuration for the webhook."
						description_kind: "plain"
					}
					max_items: 1
				}
				description_kind: "plain"
			}
		}
		github_team: {
			version: 0
			block: {
				attributes: {
					create_default_maintainer: {
						type:             "bool"
						description:      "Adds a default maintainer to the team. Adds the creating user to the team when 'true'."
						description_kind: "plain"
						optional:         true
					}
					description: {
						type:             "string"
						description:      "A description of the team."
						description_kind: "plain"
						optional:         true
					}
					etag: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					ldap_dn: {
						type:             "string"
						description:      "The LDAP Distinguished Name of the group where membership will be synchronized. Only available in GitHub Enterprise Server."
						description_kind: "plain"
						optional:         true
					}
					members_count: {
						type:             "number"
						description_kind: "plain"
						computed:         true
					}
					name: {
						type:             "string"
						description:      "The name of the team."
						description_kind: "plain"
						required:         true
					}
					node_id: {
						type:             "string"
						description:      "The Node ID of the created team."
						description_kind: "plain"
						computed:         true
					}
					parent_team_id: {
						type:             "string"
						description:      "The ID or slug of the parent team, if this is a nested team."
						description_kind: "plain"
						optional:         true
					}
					parent_team_read_id: {
						type:             "string"
						description:      "The id of the parent team read in Github."
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					parent_team_read_slug: {
						type:             "string"
						description:      "The id of the parent team read in Github."
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					privacy: {
						type:             "string"
						description:      "The level of privacy for the team. Must be one of 'secret' or 'closed'."
						description_kind: "plain"
						optional:         true
					}
					slug: {
						type:             "string"
						description:      "The slug of the created team."
						description_kind: "plain"
						computed:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_team_members: {
			version: 0
			block: {
				attributes: {
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					team_id: {
						type:             "string"
						description:      "The GitHub team id or slug"
						description_kind: "plain"
						required:         true
					}
				}
				block_types: members: {
					nesting_mode: "set"
					block: {
						attributes: {
							role: {
								type:             "string"
								description:      "The role of the user within the team. Must be one of 'member' or 'maintainer'."
								description_kind: "plain"
								optional:         true
							}
							username: {
								type:             "string"
								description:      "The user to add to the team."
								description_kind: "plain"
								required:         true
							}
						}
						description:      "List of team members."
						description_kind: "plain"
					}
					min_items: 1
				}
				description_kind: "plain"
			}
		}
		github_team_membership: {
			version: 0
			block: {
				attributes: {
					etag: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					role: {
						type:             "string"
						description:      "The role of the user within the team. Must be one of 'member' or 'maintainer'."
						description_kind: "plain"
						optional:         true
					}
					team_id: {
						type:             "string"
						description:      "The GitHub team id or the GitHub team slug."
						description_kind: "plain"
						required:         true
					}
					username: {
						type:             "string"
						description:      "The user to add to the team."
						description_kind: "plain"
						required:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_team_repository: {
			version: 0
			block: {
				attributes: {
					etag: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					permission: {
						type:             "string"
						description:      "The permissions of team members regarding the repository. Must be one of 'pull', 'triage', 'push', 'maintain', 'admin' or the name of an existing custom repository role within the organisation."
						description_kind: "plain"
						optional:         true
					}
					repository: {
						type:             "string"
						description:      "The repository to add to the team."
						description_kind: "plain"
						required:         true
					}
					team_id: {
						type:             "string"
						description:      "ID or slug of team"
						description_kind: "plain"
						required:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_team_settings: {
			version: 0
			block: {
				attributes: {
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					team_id: {
						type:             "string"
						description:      "The GitHub team id or the GitHub team slug."
						description_kind: "plain"
						required:         true
					}
					team_slug: {
						type:             "string"
						description:      "The slug of the Team within the Organization."
						description_kind: "plain"
						computed:         true
					}
					team_uid: {
						type:             "string"
						description:      "The unique ID of the Team on GitHub. Corresponds to the ID of the 'github_team_settings' resource."
						description_kind: "plain"
						computed:         true
					}
				}
				block_types: review_request_delegation: {
					nesting_mode: "list"
					block: {
						attributes: {
							algorithm: {
								type:             "string"
								description:      "The algorithm to use when assigning pull requests to team members. Supported values are 'ROUND_ROBIN' and 'LOAD_BALANCE'."
								description_kind: "plain"
								optional:         true
							}
							member_count: {
								type:             "number"
								description:      "The number of team members to assign to a pull request."
								description_kind: "plain"
								optional:         true
							}
							notify: {
								type:             "bool"
								description:      "whether to notify the entire team when at least one member is also assigned to the pull request."
								description_kind: "plain"
								optional:         true
							}
						}
						description:      "The settings for delegating code reviews to individuals on behalf of the team. If this block is present, even without any fields, then review request delegation will be enabled for the team."
						description_kind: "plain"
					}
					max_items: 1
				}
				description_kind: "plain"
			}
		}
		github_team_sync_group_mapping: {
			version: 0
			block: {
				attributes: {
					etag: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					team_slug: {
						type:             "string"
						description:      "Slug of the team."
						description_kind: "plain"
						required:         true
					}
				}
				block_types: group: {
					nesting_mode: "set"
					block: {
						attributes: {
							group_description: {
								type:             "string"
								description:      "The description of the IdP group."
								description_kind: "plain"
								required:         true
							}
							group_id: {
								type:             "string"
								description:      "The ID of the IdP group."
								description_kind: "plain"
								required:         true
							}
							group_name: {
								type:             "string"
								description:      "The name of the IdP group."
								description_kind: "plain"
								required:         true
							}
						}
						description:      "An Array of GitHub Identity Provider Groups (or empty [])."
						description_kind: "plain"
					}
				}
				description_kind: "plain"
			}
		}
		github_user_gpg_key: {
			version: 0
			block: {
				attributes: {
					armored_public_key: {
						type:             "string"
						description:      "Your public GPG key, generated in ASCII-armored format."
						description_kind: "plain"
						required:         true
					}
					etag: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					key_id: {
						type:             "string"
						description:      "The key ID of the GPG key."
						description_kind: "plain"
						computed:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_user_invitation_accepter: {
			version: 0
			block: {
				attributes: {
					allow_empty_id: {
						type:             "bool"
						description:      "Allow the ID to be unset. This will result in the resource being skipped when the ID is not set instead of returning an error."
						description_kind: "plain"
						optional:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					invitation_id: {
						type:             "string"
						description:      "ID of the invitation to accept. Must be set when 'allow_empty_id' is 'false'."
						description_kind: "plain"
						optional:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_user_ssh_key: {
			version: 0
			block: {
				attributes: {
					etag: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					key: {
						type:             "string"
						description:      "The public SSH key to add to your GitHub account."
						description_kind: "plain"
						required:         true
					}
					title: {
						type:             "string"
						description:      "A descriptive name for the new key."
						description_kind: "plain"
						required:         true
					}
					url: {
						type:             "string"
						description:      "The URL of the SSH key."
						description_kind: "plain"
						computed:         true
					}
				}
				description_kind: "plain"
			}
		}
	}
	data_source_schemas: {
		github_actions_environment_secrets: {
			version: 0
			block: {
				attributes: {
					environment: {
						type:             "string"
						description_kind: "plain"
						required:         true
					}
					full_name: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					name: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					secrets: {
						type: ["list", ["object", {
							created_at: "string"
							name:       "string"
							updated_at: "string"
						}]]
						description_kind: "plain"
						computed:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_actions_environment_variables: {
			version: 0
			block: {
				attributes: {
					environment: {
						type:             "string"
						description_kind: "plain"
						required:         true
					}
					full_name: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					name: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					variables: {
						type: ["list", ["object", {
							created_at: "string"
							name:       "string"
							updated_at: "string"
							value:      "string"
						}]]
						description_kind: "plain"
						computed:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_actions_organization_oidc_subject_claim_customization_template: {
			version: 0
			block: {
				attributes: {
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					include_claim_keys: {
						type: ["list", "string"]
						description_kind: "plain"
						computed:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_actions_organization_public_key: {
			version: 0
			block: {
				attributes: {
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					key: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					key_id: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_actions_organization_registration_token: {
			version: 0
			block: {
				attributes: {
					expires_at: {
						type:             "number"
						description_kind: "plain"
						computed:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					token: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_actions_organization_secrets: {
			version: 0
			block: {
				attributes: {
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					secrets: {
						type: ["list", ["object", {
							created_at: "string"
							name:       "string"
							updated_at: "string"
							visibility: "string"
						}]]
						description_kind: "plain"
						computed:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_actions_organization_variables: {
			version: 0
			block: {
				attributes: {
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					variables: {
						type: ["list", ["object", {
							created_at: "string"
							name:       "string"
							updated_at: "string"
							value:      "string"
							visibility: "string"
						}]]
						description_kind: "plain"
						computed:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_actions_public_key: {
			version: 0
			block: {
				attributes: {
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					key: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					key_id: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					repository: {
						type:             "string"
						description_kind: "plain"
						required:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_actions_registration_token: {
			version: 0
			block: {
				attributes: {
					expires_at: {
						type:             "number"
						description_kind: "plain"
						computed:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					repository: {
						type:             "string"
						description_kind: "plain"
						required:         true
					}
					token: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_actions_repository_oidc_subject_claim_customization_template: {
			version: 0
			block: {
				attributes: {
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					include_claim_keys: {
						type: ["list", "string"]
						description_kind: "plain"
						computed:         true
					}
					name: {
						type:             "string"
						description_kind: "plain"
						required:         true
					}
					use_default: {
						type:             "bool"
						description_kind: "plain"
						computed:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_actions_secrets: {
			version: 0
			block: {
				attributes: {
					full_name: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					name: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					secrets: {
						type: ["list", ["object", {
							created_at: "string"
							name:       "string"
							updated_at: "string"
						}]]
						description_kind: "plain"
						computed:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_actions_variables: {
			version: 0
			block: {
				attributes: {
					full_name: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					name: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					variables: {
						type: ["list", ["object", {
							created_at: "string"
							name:       "string"
							updated_at: "string"
							value:      "string"
						}]]
						description_kind: "plain"
						computed:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_app: {
			version: 0
			block: {
				attributes: {
					description: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					name: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					node_id: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					slug: {
						type:             "string"
						description_kind: "plain"
						required:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_app_token: {
			version: 0
			block: {
				attributes: {
					app_id: {
						type:             "string"
						description:      "The GitHub App ID."
						description_kind: "plain"
						required:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					installation_id: {
						type:             "string"
						description:      "The GitHub App installation instance ID."
						description_kind: "plain"
						required:         true
					}
					pem_file: {
						type:             "string"
						description:      "The GitHub App PEM file contents."
						description_kind: "plain"
						required:         true
					}
					token: {
						type:             "string"
						description:      "The generated token from the credentials."
						description_kind: "plain"
						computed:         true
						sensitive:        true
					}
				}
				description_kind: "plain"
			}
		}
		github_branch: {
			version: 0
			block: {
				attributes: {
					branch: {
						type:             "string"
						description_kind: "plain"
						required:         true
					}
					etag: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					ref: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					repository: {
						type:             "string"
						description_kind: "plain"
						required:         true
					}
					sha: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_branch_protection_rules: {
			version: 0
			block: {
				attributes: {
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					repository: {
						type:             "string"
						description_kind: "plain"
						required:         true
					}
					rules: {
						type: ["list", ["object", {
							pattern: "string"
						}]]
						description_kind: "plain"
						computed:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_codespaces_organization_public_key: {
			version: 0
			block: {
				attributes: {
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					key: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					key_id: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_codespaces_organization_secrets: {
			version: 0
			block: {
				attributes: {
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					secrets: {
						type: ["list", ["object", {
							created_at: "string"
							name:       "string"
							updated_at: "string"
							visibility: "string"
						}]]
						description_kind: "plain"
						computed:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_codespaces_public_key: {
			version: 0
			block: {
				attributes: {
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					key: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					key_id: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					repository: {
						type:             "string"
						description_kind: "plain"
						required:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_codespaces_secrets: {
			version: 0
			block: {
				attributes: {
					full_name: {
						type:             "string"
						description:      "Full name of the repository (in `org/name` format)."
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					name: {
						type:             "string"
						description:      "The name of the repository."
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					secrets: {
						type: ["list", ["object", {
							created_at: "string"
							name:       "string"
							updated_at: "string"
						}]]
						description_kind: "plain"
						computed:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_codespaces_user_public_key: {
			version: 0
			block: {
				attributes: {
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					key: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					key_id: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_codespaces_user_secrets: {
			version: 0
			block: {
				attributes: {
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					secrets: {
						type: ["list", ["object", {
							created_at: "string"
							name:       "string"
							updated_at: "string"
							visibility: "string"
						}]]
						description_kind: "plain"
						computed:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_collaborators: {
			version: 0
			block: {
				attributes: {
					affiliation: {
						type:             "string"
						description_kind: "plain"
						optional:         true
					}
					collaborator: {
						type: ["list", ["object", {
							events_url:          "string"
							followers_url:       "string"
							following_url:       "string"
							gists_url:           "string"
							html_url:            "string"
							id:                  "number"
							login:               "string"
							organizations_url:   "string"
							permission:          "string"
							received_events_url: "string"
							repos_url:           "string"
							site_admin:          "bool"
							starred_url:         "string"
							subscriptions_url:   "string"
							type:                "string"
							url:                 "string"
						}]]
						description_kind: "plain"
						computed:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					owner: {
						type:             "string"
						description_kind: "plain"
						required:         true
					}
					repository: {
						type:             "string"
						description_kind: "plain"
						required:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_dependabot_organization_public_key: {
			version: 0
			block: {
				attributes: {
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					key: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					key_id: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_dependabot_organization_secrets: {
			version: 0
			block: {
				attributes: {
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					secrets: {
						type: ["list", ["object", {
							created_at: "string"
							name:       "string"
							updated_at: "string"
							visibility: "string"
						}]]
						description_kind: "plain"
						computed:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_dependabot_public_key: {
			version: 0
			block: {
				attributes: {
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					key: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					key_id: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					repository: {
						type:             "string"
						description_kind: "plain"
						required:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_dependabot_secrets: {
			version: 0
			block: {
				attributes: {
					full_name: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					name: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					secrets: {
						type: ["list", ["object", {
							created_at: "string"
							name:       "string"
							updated_at: "string"
						}]]
						description_kind: "plain"
						computed:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_enterprise: {
			version: 0
			block: {
				attributes: {
					created_at: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					database_id: {
						type:             "number"
						description_kind: "plain"
						computed:         true
					}
					description: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					name: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					slug: {
						type:             "string"
						description_kind: "plain"
						required:         true
					}
					url: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_external_groups: {
			version: 0
			block: {
				attributes: {
					external_groups: {
						type: ["list", ["object", {
							group_id:   "number"
							group_name: "string"
							updated_at: "string"
						}]]
						description_kind: "plain"
						computed:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_ip_ranges: {
			version: 0
			block: {
				attributes: {
					actions: {
						type: ["list", "string"]
						description_kind: "plain"
						computed:         true
					}
					actions_ipv4: {
						type: ["list", "string"]
						description_kind: "plain"
						computed:         true
					}
					actions_ipv6: {
						type: ["list", "string"]
						description_kind: "plain"
						computed:         true
					}
					api: {
						type: ["list", "string"]
						description_kind: "plain"
						computed:         true
					}
					api_ipv4: {
						type: ["list", "string"]
						description_kind: "plain"
						computed:         true
					}
					api_ipv6: {
						type: ["list", "string"]
						description_kind: "plain"
						computed:         true
					}
					dependabot: {
						type: ["list", "string"]
						description_kind: "plain"
						computed:         true
					}
					dependabot_ipv4: {
						type: ["list", "string"]
						description_kind: "plain"
						computed:         true
					}
					dependabot_ipv6: {
						type: ["list", "string"]
						description_kind: "plain"
						computed:         true
					}
					git: {
						type: ["list", "string"]
						description_kind: "plain"
						computed:         true
					}
					git_ipv4: {
						type: ["list", "string"]
						description_kind: "plain"
						computed:         true
					}
					git_ipv6: {
						type: ["list", "string"]
						description_kind: "plain"
						computed:         true
					}
					hooks: {
						type: ["list", "string"]
						description_kind: "plain"
						computed:         true
					}
					hooks_ipv4: {
						type: ["list", "string"]
						description_kind: "plain"
						computed:         true
					}
					hooks_ipv6: {
						type: ["list", "string"]
						description_kind: "plain"
						computed:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					importer: {
						type: ["list", "string"]
						description_kind: "plain"
						computed:         true
					}
					importer_ipv4: {
						type: ["list", "string"]
						description_kind: "plain"
						computed:         true
					}
					importer_ipv6: {
						type: ["list", "string"]
						description_kind: "plain"
						computed:         true
					}
					packages: {
						type: ["list", "string"]
						description_kind: "plain"
						computed:         true
					}
					packages_ipv4: {
						type: ["list", "string"]
						description_kind: "plain"
						computed:         true
					}
					packages_ipv6: {
						type: ["list", "string"]
						description_kind: "plain"
						computed:         true
					}
					pages: {
						type: ["list", "string"]
						description_kind: "plain"
						computed:         true
					}
					pages_ipv4: {
						type: ["list", "string"]
						description_kind: "plain"
						computed:         true
					}
					pages_ipv6: {
						type: ["list", "string"]
						description_kind: "plain"
						computed:         true
					}
					web: {
						type: ["list", "string"]
						description_kind: "plain"
						computed:         true
					}
					web_ipv4: {
						type: ["list", "string"]
						description_kind: "plain"
						computed:         true
					}
					web_ipv6: {
						type: ["list", "string"]
						description_kind: "plain"
						computed:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_issue_labels: {
			version: 0
			block: {
				attributes: {
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					labels: {
						type: ["list", ["object", {
							color:       "string"
							description: "string"
							name:        "string"
							url:         "string"
						}]]
						description_kind: "plain"
						computed:         true
					}
					repository: {
						type:             "string"
						description_kind: "plain"
						required:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_membership: {
			version: 0
			block: {
				attributes: {
					etag: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					organization: {
						type:             "string"
						description_kind: "plain"
						optional:         true
					}
					role: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					state: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					username: {
						type:             "string"
						description_kind: "plain"
						required:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_organization: {
			version: 0
			block: {
				attributes: {
					advanced_security_enabled_for_new_repositories: {
						type:             "bool"
						description_kind: "plain"
						computed:         true
					}
					default_repository_permission: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					dependabot_alerts_enabled_for_new_repositories: {
						type:             "bool"
						description_kind: "plain"
						computed:         true
					}
					dependabot_security_updates_enabled_for_new_repositories: {
						type:             "bool"
						description_kind: "plain"
						computed:         true
					}
					dependency_graph_enabled_for_new_repositories: {
						type:             "bool"
						description_kind: "plain"
						computed:         true
					}
					description: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					ignore_archived_repos: {
						type:             "bool"
						description_kind: "plain"
						optional:         true
					}
					login: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					members: {
						type: ["list", "string"]
						description_kind: "plain"
						deprecated:       true
						computed:         true
					}
					members_allowed_repository_creation_type: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					members_can_create_internal_repositories: {
						type:             "bool"
						description_kind: "plain"
						computed:         true
					}
					members_can_create_pages: {
						type:             "bool"
						description_kind: "plain"
						computed:         true
					}
					members_can_create_private_pages: {
						type:             "bool"
						description_kind: "plain"
						computed:         true
					}
					members_can_create_private_repositories: {
						type:             "bool"
						description_kind: "plain"
						computed:         true
					}
					members_can_create_public_pages: {
						type:             "bool"
						description_kind: "plain"
						computed:         true
					}
					members_can_create_public_repositories: {
						type:             "bool"
						description_kind: "plain"
						computed:         true
					}
					members_can_create_repositories: {
						type:             "bool"
						description_kind: "plain"
						computed:         true
					}
					members_can_fork_private_repositories: {
						type:             "bool"
						description_kind: "plain"
						computed:         true
					}
					name: {
						type:             "string"
						description_kind: "plain"
						required:         true
					}
					node_id: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					orgname: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					plan: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					repositories: {
						type: ["list", "string"]
						description_kind: "plain"
						computed:         true
					}
					secret_scanning_enabled_for_new_repositories: {
						type:             "bool"
						description_kind: "plain"
						computed:         true
					}
					secret_scanning_push_protection_enabled_for_new_repositories: {
						type:             "bool"
						description_kind: "plain"
						computed:         true
					}
					two_factor_requirement_enabled: {
						type:             "bool"
						description_kind: "plain"
						computed:         true
					}
					users: {
						type: ["list", ["map", "string"]]
						description_kind: "plain"
						computed:         true
					}
					web_commit_signoff_required: {
						type:             "bool"
						description_kind: "plain"
						computed:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_organization_custom_role: {
			version: 0
			block: {
				attributes: {
					base_role: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					description: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					name: {
						type:             "string"
						description_kind: "plain"
						required:         true
					}
					permissions: {
						type: ["set", "string"]
						description_kind: "plain"
						computed:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_organization_external_identities: {
			version: 0
			block: {
				attributes: {
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					identities: {
						type: ["list", ["object", {
							login: "string"
							saml_identity: ["map", "string"]
							scim_identity: ["map", "string"]
						}]]
						description_kind: "plain"
						computed:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_organization_ip_allow_list: {
			version: 0
			block: {
				attributes: {
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					ip_allow_list: {
						type: ["list", ["object", {
							allow_list_value: "string"
							created_at:       "string"
							id:               "string"
							is_active:        "bool"
							name:             "string"
							updated_at:       "string"
						}]]
						description_kind: "plain"
						computed:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_organization_team_sync_groups: {
			version: 0
			block: {
				attributes: {
					groups: {
						type: ["list", ["object", {
							group_description: "string"
							group_id:          "string"
							group_name:        "string"
						}]]
						description_kind: "plain"
						computed:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_organization_teams: {
			version: 0
			block: {
				attributes: {
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					results_per_page: {
						type:             "number"
						description_kind: "plain"
						optional:         true
					}
					root_teams_only: {
						type:             "bool"
						description_kind: "plain"
						optional:         true
					}
					summary_only: {
						type:             "bool"
						description_kind: "plain"
						optional:         true
					}
					teams: {
						type: ["list", ["object", {
							description: "string"
							id:          "number"
							members: ["list", "string"]
							name:    "string"
							node_id: "string"
							parent: ["map", "string"]
							privacy: "string"
							repositories: ["list", "string"]
							slug: "string"
						}]]
						description_kind: "plain"
						computed:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_organization_webhooks: {
			version: 0
			block: {
				attributes: {
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					webhooks: {
						type: ["list", ["object", {
							active: "bool"
							id:     "number"
							name:   "string"
							type:   "string"
							url:    "string"
						}]]
						description_kind: "plain"
						computed:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_ref: {
			version: 0
			block: {
				attributes: {
					etag: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					owner: {
						type:             "string"
						description_kind: "plain"
						optional:         true
					}
					ref: {
						type:             "string"
						description_kind: "plain"
						required:         true
					}
					repository: {
						type:             "string"
						description_kind: "plain"
						required:         true
					}
					sha: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_release: {
			version: 0
			block: {
				attributes: {
					asserts_url: {
						type:             "string"
						description_kind: "plain"
						deprecated:       true
						computed:         true
					}
					assets: {
						type: ["list", ["object", {
							browser_download_url: "string"
							content_type:         "string"
							created_at:           "string"
							id:                   "number"
							label:                "string"
							name:                 "string"
							node_id:              "string"
							size:                 "number"
							updated_at:           "string"
							url:                  "string"
						}]]
						description_kind: "plain"
						computed:         true
					}
					assets_url: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					body: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					created_at: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					draft: {
						type:             "bool"
						description_kind: "plain"
						computed:         true
					}
					html_url: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					name: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					owner: {
						type:             "string"
						description_kind: "plain"
						required:         true
					}
					prerelease: {
						type:             "bool"
						description_kind: "plain"
						computed:         true
					}
					published_at: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					release_id: {
						type:             "number"
						description_kind: "plain"
						optional:         true
					}
					release_tag: {
						type:             "string"
						description_kind: "plain"
						optional:         true
					}
					repository: {
						type:             "string"
						description_kind: "plain"
						required:         true
					}
					retrieve_by: {
						type:             "string"
						description_kind: "plain"
						required:         true
					}
					tarball_url: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					target_commitish: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					upload_url: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					url: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					zipball_url: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_repositories: {
			version: 0
			block: {
				attributes: {
					full_names: {
						type: ["list", "string"]
						description_kind: "plain"
						computed:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					include_repo_id: {
						type:             "bool"
						description_kind: "plain"
						optional:         true
					}
					names: {
						type: ["list", "string"]
						description_kind: "plain"
						computed:         true
					}
					query: {
						type:             "string"
						description_kind: "plain"
						required:         true
					}
					repo_ids: {
						type: ["list", "number"]
						description_kind: "plain"
						computed:         true
					}
					results_per_page: {
						type:             "number"
						description_kind: "plain"
						optional:         true
					}
					sort: {
						type:             "string"
						description_kind: "plain"
						optional:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_repository: {
			version: 0
			block: {
				attributes: {
					allow_auto_merge: {
						type:             "bool"
						description_kind: "plain"
						computed:         true
					}
					allow_merge_commit: {
						type:             "bool"
						description_kind: "plain"
						computed:         true
					}
					allow_rebase_merge: {
						type:             "bool"
						description_kind: "plain"
						computed:         true
					}
					allow_squash_merge: {
						type:             "bool"
						description_kind: "plain"
						computed:         true
					}
					archived: {
						type:             "bool"
						description_kind: "plain"
						computed:         true
					}
					default_branch: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					description: {
						type:             "string"
						description_kind: "plain"
						optional:         true
					}
					fork: {
						type:             "bool"
						description_kind: "plain"
						computed:         true
					}
					full_name: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					git_clone_url: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					has_discussions: {
						type:             "bool"
						description_kind: "plain"
						computed:         true
					}
					has_downloads: {
						type:             "bool"
						description_kind: "plain"
						computed:         true
					}
					has_issues: {
						type:             "bool"
						description_kind: "plain"
						computed:         true
					}
					has_projects: {
						type:             "bool"
						description_kind: "plain"
						computed:         true
					}
					has_wiki: {
						type:             "bool"
						description_kind: "plain"
						computed:         true
					}
					homepage_url: {
						type:             "string"
						description_kind: "plain"
						optional:         true
					}
					html_url: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					http_clone_url: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					is_template: {
						type:             "bool"
						description_kind: "plain"
						computed:         true
					}
					merge_commit_message: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					merge_commit_title: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					name: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					node_id: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					pages: {
						type: ["list", ["object", {
							build_type: "string"
							cname:      "string"
							custom_404: "bool"
							html_url:   "string"
							source: ["list", ["object", {
								branch: "string"
								path:   "string"
							}]]
							status: "string"
							url:    "string"
						}]]
						description_kind: "plain"
						computed:         true
					}
					primary_language: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					private: {
						type:             "bool"
						description_kind: "plain"
						computed:         true
					}
					repo_id: {
						type:             "number"
						description_kind: "plain"
						computed:         true
					}
					repository_license: {
						type: ["list", ["object", {
							content:      "string"
							download_url: "string"
							encoding:     "string"
							git_url:      "string"
							html_url:     "string"
							license: ["list", ["object", {
								body: "string"
								conditions: ["set", "string"]
								description:    "string"
								featured:       "bool"
								html_url:       "string"
								implementation: "string"
								key:            "string"
								limitations: ["set", "string"]
								name: "string"
								permissions: ["set", "string"]
								spdx_id: "string"
								url:     "string"
							}]]
							name: "string"
							path: "string"
							sha:  "string"
							size: "number"
							type: "string"
							url:  "string"
						}]]
						description_kind: "plain"
						computed:         true
					}
					squash_merge_commit_message: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					squash_merge_commit_title: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					ssh_clone_url: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					svn_url: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					template: {
						type: ["list", ["object", {
							owner:      "string"
							repository: "string"
						}]]
						description_kind: "plain"
						computed:         true
					}
					topics: {
						type: ["list", "string"]
						description_kind: "plain"
						computed:         true
					}
					visibility: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_repository_autolink_references: {
			version: 0
			block: {
				attributes: {
					autolink_references: {
						type: ["list", ["object", {
							is_alphanumeric:     "bool"
							key_prefix:          "string"
							target_url_template: "string"
						}]]
						description_kind: "plain"
						computed:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					repository: {
						type:             "string"
						description_kind: "plain"
						required:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_repository_branches: {
			version: 0
			block: {
				attributes: {
					branches: {
						type: ["list", ["object", {
							name:      "string"
							protected: "bool"
						}]]
						description_kind: "plain"
						computed:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					only_non_protected_branches: {
						type:             "bool"
						description_kind: "plain"
						optional:         true
					}
					only_protected_branches: {
						type:             "bool"
						description_kind: "plain"
						optional:         true
					}
					repository: {
						type:             "string"
						description_kind: "plain"
						required:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_repository_deploy_keys: {
			version: 0
			block: {
				attributes: {
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					keys: {
						type: ["list", ["object", {
							id:       "number"
							key:      "string"
							title:    "string"
							verified: "bool"
						}]]
						description_kind: "plain"
						computed:         true
					}
					repository: {
						type:             "string"
						description_kind: "plain"
						required:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_repository_deployment_branch_policies: {
			version: 0
			block: {
				attributes: {
					deployment_branch_policies: {
						type: ["list", ["object", {
							id:   "string"
							name: "string"
						}]]
						description_kind: "plain"
						computed:         true
					}
					environment_name: {
						type:             "string"
						description:      "The target environment name."
						description_kind: "plain"
						required:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					repository: {
						type:             "string"
						description:      "The GitHub repository name."
						description_kind: "plain"
						required:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_repository_environments: {
			version: 0
			block: {
				attributes: {
					environments: {
						type: ["list", ["object", {
							name:    "string"
							node_id: "string"
						}]]
						description_kind: "plain"
						computed:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					repository: {
						type:             "string"
						description_kind: "plain"
						required:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_repository_file: {
			version: 0
			block: {
				attributes: {
					branch: {
						type:             "string"
						description:      "The branch name, defaults to the repository's default branch"
						description_kind: "plain"
						optional:         true
					}
					commit_author: {
						type:             "string"
						description:      "The commit author name, defaults to the authenticated user's name"
						description_kind: "plain"
						computed:         true
					}
					commit_email: {
						type:             "string"
						description:      "The commit author email address, defaults to the authenticated user's email address"
						description_kind: "plain"
						computed:         true
					}
					commit_message: {
						type:             "string"
						description:      "The commit message when creating or updating the file"
						description_kind: "plain"
						computed:         true
					}
					commit_sha: {
						type:             "string"
						description:      "The SHA of the commit that modified the file"
						description_kind: "plain"
						computed:         true
					}
					content: {
						type:             "string"
						description:      "The file's content"
						description_kind: "plain"
						computed:         true
					}
					file: {
						type:             "string"
						description:      "The file path to manage"
						description_kind: "plain"
						required:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					ref: {
						type:             "string"
						description:      "The name of the commit/branch/tag"
						description_kind: "plain"
						computed:         true
					}
					repository: {
						type:             "string"
						description:      "The repository name"
						description_kind: "plain"
						required:         true
					}
					sha: {
						type:             "string"
						description:      "The blob SHA of the file"
						description_kind: "plain"
						computed:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_repository_milestone: {
			version: 0
			block: {
				attributes: {
					description: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					due_date: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					number: {
						type:             "number"
						description_kind: "plain"
						required:         true
					}
					owner: {
						type:             "string"
						description_kind: "plain"
						required:         true
					}
					repository: {
						type:             "string"
						description_kind: "plain"
						required:         true
					}
					state: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					title: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_repository_pull_request: {
			version: 0
			block: {
				attributes: {
					base_ref: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					base_repository: {
						type:             "string"
						description_kind: "plain"
						required:         true
					}
					base_sha: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					body: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					draft: {
						type:             "bool"
						description_kind: "plain"
						computed:         true
					}
					head_owner: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					head_ref: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					head_repository: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					head_sha: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					labels: {
						type: ["list", "string"]
						description:      "List of names of labels on the PR"
						description_kind: "plain"
						computed:         true
					}
					maintainer_can_modify: {
						type:             "bool"
						description_kind: "plain"
						computed:         true
					}
					number: {
						type:             "number"
						description_kind: "plain"
						required:         true
					}
					opened_at: {
						type:             "number"
						description_kind: "plain"
						computed:         true
					}
					opened_by: {
						type:             "string"
						description:      "Username of the PR creator"
						description_kind: "plain"
						computed:         true
					}
					owner: {
						type:             "string"
						description_kind: "plain"
						optional:         true
					}
					state: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					title: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					updated_at: {
						type:             "number"
						description_kind: "plain"
						computed:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_repository_pull_requests: {
			version: 0
			block: {
				attributes: {
					base_ref: {
						type:             "string"
						description_kind: "plain"
						optional:         true
					}
					base_repository: {
						type:             "string"
						description_kind: "plain"
						required:         true
					}
					head_ref: {
						type:             "string"
						description_kind: "plain"
						optional:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					owner: {
						type:             "string"
						description_kind: "plain"
						optional:         true
					}
					results: {
						type: ["list", ["object", {
							base_ref:        "string"
							base_sha:        "string"
							body:            "string"
							draft:           "bool"
							head_owner:      "string"
							head_ref:        "string"
							head_repository: "string"
							head_sha:        "string"
							labels: ["list", "string"]
							maintainer_can_modify: "bool"
							number:                "number"
							opened_at:             "number"
							opened_by:             "string"
							state:                 "string"
							title:                 "string"
							updated_at:            "number"
						}]]
						description_kind: "plain"
						computed:         true
					}
					sort_by: {
						type:             "string"
						description_kind: "plain"
						optional:         true
					}
					sort_direction: {
						type:             "string"
						description_kind: "plain"
						optional:         true
					}
					state: {
						type:             "string"
						description_kind: "plain"
						optional:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_repository_teams: {
			version: 0
			block: {
				attributes: {
					full_name: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					name: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					teams: {
						type: ["list", ["object", {
							name:       "string"
							permission: "string"
							slug:       "string"
						}]]
						description_kind: "plain"
						computed:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_repository_webhooks: {
			version: 0
			block: {
				attributes: {
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					repository: {
						type:             "string"
						description_kind: "plain"
						required:         true
					}
					webhooks: {
						type: ["list", ["object", {
							active: "bool"
							id:     "number"
							name:   "string"
							type:   "string"
							url:    "string"
						}]]
						description_kind: "plain"
						computed:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_rest_api: {
			version: 0
			block: {
				attributes: {
					body: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					code: {
						type:             "number"
						description_kind: "plain"
						computed:         true
					}
					endpoint: {
						type:             "string"
						description_kind: "plain"
						required:         true
					}
					headers: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					status: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_ssh_keys: {
			version: 0
			block: {
				attributes: {
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					keys: {
						type: ["list", "string"]
						description_kind: "plain"
						computed:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_team: {
			version: 0
			block: {
				attributes: {
					description: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					members: {
						type: ["list", "string"]
						description_kind: "plain"
						computed:         true
					}
					membership_type: {
						type:             "string"
						description_kind: "plain"
						optional:         true
					}
					name: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					node_id: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					permission: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					privacy: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					repositories: {
						type: ["list", "string"]
						description_kind: "plain"
						computed:         true
					}
					repositories_detailed: {
						type: ["list", ["object", {
							repo_id:   "number"
							role_name: "string"
						}]]
						description_kind: "plain"
						computed:         true
					}
					results_per_page: {
						type:             "number"
						description_kind: "plain"
						optional:         true
					}
					slug: {
						type:             "string"
						description_kind: "plain"
						required:         true
					}
					summary_only: {
						type:             "bool"
						description_kind: "plain"
						optional:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_tree: {
			version: 0
			block: {
				attributes: {
					entries: {
						type: ["list", ["object", {
							mode: "string"
							path: "string"
							sha:  "string"
							size: "number"
							type: "string"
						}]]
						description_kind: "plain"
						computed:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					recursive: {
						type:             "bool"
						description_kind: "plain"
						optional:         true
					}
					repository: {
						type:             "string"
						description_kind: "plain"
						required:         true
					}
					tree_sha: {
						type:             "string"
						description_kind: "plain"
						required:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_user: {
			version: 0
			block: {
				attributes: {
					avatar_url: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					bio: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					blog: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					company: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					created_at: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					email: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					followers: {
						type:             "number"
						description_kind: "plain"
						computed:         true
					}
					following: {
						type:             "number"
						description_kind: "plain"
						computed:         true
					}
					gpg_keys: {
						type: ["list", "string"]
						description_kind: "plain"
						computed:         true
					}
					gravatar_id: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					location: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					login: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					name: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					node_id: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					public_gists: {
						type:             "number"
						description_kind: "plain"
						computed:         true
					}
					public_repos: {
						type:             "number"
						description_kind: "plain"
						computed:         true
					}
					site_admin: {
						type:             "bool"
						description_kind: "plain"
						computed:         true
					}
					ssh_keys: {
						type: ["list", "string"]
						description_kind: "plain"
						computed:         true
					}
					suspended_at: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					updated_at: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					username: {
						type:             "string"
						description_kind: "plain"
						required:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_user_external_identity: {
			version: 0
			block: {
				attributes: {
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					login: {
						type:             "string"
						description_kind: "plain"
						computed:         true
					}
					saml_identity: {
						type: ["map", "string"]
						description_kind: "plain"
						computed:         true
					}
					scim_identity: {
						type: ["map", "string"]
						description_kind: "plain"
						computed:         true
					}
					username: {
						type:             "string"
						description_kind: "plain"
						required:         true
					}
				}
				description_kind: "plain"
			}
		}
		github_users: {
			version: 0
			block: {
				attributes: {
					emails: {
						type: ["list", "string"]
						description_kind: "plain"
						computed:         true
					}
					id: {
						type:             "string"
						description_kind: "plain"
						optional:         true
						computed:         true
					}
					logins: {
						type: ["list", "string"]
						description_kind: "plain"
						computed:         true
					}
					node_ids: {
						type: ["list", "string"]
						description_kind: "plain"
						computed:         true
					}
					unknown_logins: {
						type: ["list", "string"]
						description_kind: "plain"
						computed:         true
					}
					usernames: {
						type: ["list", "string"]
						description_kind: "plain"
						required:         true
					}
				}
				description_kind: "plain"
			}
		}
	}
}
