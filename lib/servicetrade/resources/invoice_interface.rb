module Servicetrade
  class InvoiceInterface < Servicetrade::ResourceInterface

    def allowed_verbs
      return ["GET", "POST", "PUT"]
    end

    def base_url
      return "/invoice"
    end

    def name
      return "invoices"
    end

    def get_params
      return{ assignedUserId: {type: "integer", optional: true, allowed_values: [], message: "user to which this invoice is assigned"}, 
      jobId: {type: "integer", optional: true, allowed_values: [], message: "job to which this invoice is attached"}, 
      customerId: {type: "integer", optional: true, allowed_values: [], message: "customer for this invoice"}, 
      contractId: {type: "integer", optional: true, allowed_values: [], message: "contract to which this invoice is attached"}, 
      type: {type: "string", optional: true , allowed_values: ["invoice", "vendorbill", "external"], message: "comma-separated list of possible types: 'invoice', 'vendorbill', or 'external'"}, 
      status: {type: "string", optional: true , allowed_values: ['ok', 'internal_review', 'pending_accounting', 'processed', 'paid', 'sent', 'failed', 'void'], message: "comma-separated list of statuses to match, one of: ('ok', 'internal_review', 'pending_accounting', 'processed', 'paid', 'sent', 'failed', 'void')"}, 
      createdAfter: {type: "integer", optional: true, allowed_values: [], message: "created on or after this timestamp"}, 
      createdBefore: {type: "integer", optional: true, allowed_values: [], message: "created on or before this timestamp"}, 
      updatedAfter: {type: "integer", optional: true, allowed_values: [], message: "updated on or after this timestamp"}, 
      updatedBefore: {type: "integer", optional: true, allowed_values: [], message: "updated on or before this timestamp"}, 
      transactionDateBefore: {type: "integer", optional: true, allowed_values: [], message: "transactionDate on or before this timestamp"}, 
      transactionDateAfter: {type: "integer", optional: true, allowed_values: [], message: "transactionDate on or after this timestamp"}, 
      tag: {type: "string", optional: true , allowed_values: [], message: "comma-separated list of tag strings, only invoices with all tags will be returned"}, 
      partial: {type: "boolean", optional: true, allowed_values: [], message: "if true will only match partial invoices, false will only match final invoices"}, 
      invoiceRecurrenceId: {type: "integer", optional: true, allowed_values: [], message: "invoices generated for this invoice recurrence"}, 
      sort: {type: "string", optional: true , allowed_values: ["name", "transactionDate"], message: "field to sort by, one of: name, transactionDate; defaults to name."}, 
      limit: {type: "integer", optional: true, allowed_values: [], message: "limit the number of invoices returned (default 2000, maximum 2000)"}} 
    end

    def post_params
      post_parameters = self.put_params
      post_parameters[:type] = { type:"string",  optional: true, allowed_values: ['invoice', 'vendorbill', 'external', 'unknown'], message: "sets the type of invoice to one of ('invoice', 'vendorbill', 'external', 'unknown'). This is a POST only field."}
      post_parameters[:status] = { type:"string",  optional: true, allowed_values: ['ok', 'internal_review', 'pending_accounting', 'processed', 'paid', 'sent', 'failed', 'void'], message: "sets the invoice status to one of ('ok', 'internal_review', 'pending_accounting', 'processed', 'paid', 'sent', 'failed', 'void') Note: some status transitions are invalid"}
      post_parameters[:jobId] = {  type:"integer", optional: true, allowed_values: [], message: "sets the job to which this invoice is attached. This is a POST only field."}
      post_parameters[:locationId] = { type:"integer", optional: true, allowed_values: [], message: "sets the location of the invoice. This is a POST only field. Not to be used with jobId, as location, customer, and vendor are determined from the job if set."}
      post_parameters[:customerId] = { type:"integer", optional: true, allowed_values: [], message: "sets the customer of the invoice. This is a POST only field. Not to be used with jobId, as location, customer, and vendor are determined from the job if set."}
      post_parameters[:vendorId] = { type:"integer", optional: true, allowed_values: [], message: "sets the vendor of the invoice. This is a POST only field. Not to be used with jobId, as location, customer, and vendor are determined from the job if set."}
      post_parameters[:items] = {  type:"array", optional: true, allowed_values: [], message: "If given, these will become the invoice items. If not given, the job's items will be used. This is a POST only field."}
      post_parameters[:applyTax] = { type:"boolean", optional: true, allowed_values: [], message: "POST only, should the new invoice have default taxes applied if location tax flag is true on any taxable lib items if there is only one tax rate found for the postal code of the location?"}
      return post_parameters
    end

    def put_params
      return { name: { type: "string", oprional: true, allowed_values: [], message: "invoice name"},
      invoiceNumber: { type: "string", oprional: true, allowed_values: [], message: "sets the invoice's human readable number to match an external accounting system"},
      notes: { type: "string", oprional: true, allowed_values: [], message: "sets the notes that are displayed and printed on the invoice"},
      partial: { type: "boolean",  oprional: true, allowed_values: [], message: "sets this invoice as non-final"},
      assignedUserId: { type: "integer",  oprional: true, allowed_values: [], message: "sets the user to which this invoice is assigned"},
      contractId: { type: "integer",  oprional: true, allowed_values: [], message: "If set, an invoice is generated for the jobId using the contractId. The contractId must be provided if invoice items should be generated from job items. If the contractId is for a contract that does not apply to the job, the API will return a 409 error."},
      transactionDate: { type: "integer",  oprional: true, allowed_values: [], message: "Unix timestamp indicating the date on which this invoice was transacted. Defaults to creation date if not provided."}}
    end
  end
end
