# Adds icon so that cookie consent permissions can ne changed later
$EPrints::Plugin::Stats::EP_TRIGGER_DYNAMIC_TEMPLATE ||= 16;
$c->add_trigger( $EPrints::Plugin::Stats::EP_TRIGGER_DYNAMIC_TEMPLATE, sub
{
        my( %args ) = @_;

		my( $repo, $pins ) = @args{qw/ repository pins/};

        my $page = $repo->make_doc_fragment;

		my $cc_update = $repo->make_element( 'div', class => 'cc-update', id => 'cc-update' );
		my $cc_button = $repo->make_element( 'button', type => 'button', 'data-cc' => 'c-settings', class => 'cc-link', 'aria-haspopup' => 'dialog' );
		$cc_button->appendChild( $repo->html_phrase( "cookieconsent_update_button" ) );
		$cc_update->appendChild( $cc_button );
        $page->appendChild( $cc_update );

        if( defined $pins->{'utf-8.page'} )
        {
                $pins->{'utf-8.page'} .= $repo->xhtml->to_xhtml( $page );
        }

        if( defined $pins->{page} )
        {
                $page->appendChild( $pins->{page} );
                $pins->{page} = $page;
        }
        else
        {
                $pins->{page} = $page;
        }

        return EP_TRIGGER_OK;
} );

