# frozen_string_literal: true

GraphqlDemoSchema = GraphQL::Schema.define do
  mutation(Types::MutationType)
  query(Types::QueryType)

  use GraphQL::Batch
  enable_preloading
end