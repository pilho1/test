require 'spec_helper'
require 'pry'

describe 'Verify that ', type: :feature do
  subject { page }
  before { visit '/' }
 


# 1. Verify that the guest can add two “Magnanimous Post Shave” moisturizers.
# 2. Verify that the guest can remove boogies “Dream Hair Cream” from their box

  context 'the guest' do
    it 'can add two “Magnanimous Post Shave” moisturizers' do
      expect(page).to have_css('.ember-view.store-brand.shave')
      within('.ember-view.store-brand.shave') { find('h1').click }

      expect(page).to have_css('.ember-view.product-column.routable')
      within(all('.ember-view.product-column.routable')[2]) { find('.orange.add').click }
     
      expect(find('.text.quantity').text).to eql('1')
      all('.has-action')[2].click
      sleep 2
      expect(find('.text.quantity').text).to eql('2')
      find('button.wide.confirm').click

      expect(page).to have_css('.ember-view.box-receipt')
      expect(find('.ember-view.box-item').text).to eql("DR. CARVER’S MAGNANIMOUS POST SHAVE 3.4 oz QTY. 2 $18.00")

    end

    it 'can remove boogies “Dream Hair Cream” from their box' do
      
      expect(page).to have_css('.ember-view.store-brand.style')
      
      within('.ember-view.store-brand.style') { find('h1').click }

      expect(page).to have_css('.ember-view.product-column.routable')
      within(all('.ember-view.product-column.routable')[4]) { find('.orange.add').click }
     
      expect(find('.text.quantity').text).to eql('1')

      find('button.wide.confirm').click

      expect(page).to have_css('.ember-view.box-receipt')
      expect(find('.ember-view.box-item').text).to eql("BOOGIE’S DREAM HAIR CREAM 3.4 oz QTY. 1 $10.00")

      find('.tertiary').click
      expect(find('.text.quantity').text).to eql('1')
      expect(find('.last.confirm').text).to eql("OK")
      all('.has-action')[0].click
      expect(find('.last.confirm').text).to eql("REMOVE")
      find('.last.confirm').click

     
    end

  end
end