require "application_system_test_case"

class DocumentosTest < ApplicationSystemTestCase
  setup do
    @documento = documentos(:one)
  end

  test "visiting the index" do
    visit documentos_url
    assert_selector "h1", text: "Documentos"
  end

  test "should create documento" do
    visit documentos_url
    click_on "New documento"

    fill_in "Item description", with: @documento.item_description
    fill_in "Item price", with: @documento.item_price
    fill_in "Merchant address", with: @documento.merchant_address
    fill_in "Merchant name", with: @documento.merchant_name
    fill_in "Purchase count", with: @documento.purchase_count
    fill_in "Purchaser name", with: @documento.purchaser_name
    click_on "Create Documento"

    assert_text "Documento was successfully created"
    click_on "Back"
  end

  test "should update Documento" do
    visit documento_url(@documento)
    click_on "Edit this documento", match: :first

    fill_in "Item description", with: @documento.item_description
    fill_in "Item price", with: @documento.item_price
    fill_in "Merchant address", with: @documento.merchant_address
    fill_in "Merchant name", with: @documento.merchant_name
    fill_in "Purchase count", with: @documento.purchase_count
    fill_in "Purchaser name", with: @documento.purchaser_name
    click_on "Update Documento"

    assert_text "Documento was successfully updated"
    click_on "Back"
  end

  test "should destroy Documento" do
    visit documento_url(@documento)
    click_on "Destroy this documento", match: :first

    assert_text "Documento was successfully destroyed"
  end
end
