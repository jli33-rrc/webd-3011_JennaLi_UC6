ActiveAdmin.register Customer do
    permit_params :full_name, :phone_number, :email_address, :notes, :image

    filter :full_name
    filter :phone_number
    filter :email_address
    filter :created_at
    filter :updated_at

    index do
        selectable_column
        id_column
        column :full_name
        column :phone_number
        column :email_address
        column :notes
        column :image do |customer|
            if customer.image.attached?
                image_tag url_for(customer.image), size: "50x50"
            end
        end
        actions
    end

    form do |f|
        f.inputs "Customer Details" do
            f.input :full_name
            f.input :phone_number
            f.input :email_address
            f.input :notes
            f.input :image, as: :file
        end
        f.actions
    end

    show do
        attributes_table do
            row :full_name
            row :phone_number
            row :email_address
            row :notes
            row :image do |customer|
                if customer.image.attached?
                    image_tag url_for(customer.image), size: "200x200"
                end
            end
        end
    end
end
