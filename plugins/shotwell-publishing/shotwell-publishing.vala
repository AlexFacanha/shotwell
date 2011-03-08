/* Copyright 2011 Yorba Foundation
 *
 * This software is licensed under the GNU Lesser General Public License
 * (version 2.1 or later).  See the COPYING file in this distribution. 
 */

extern const string _VERSION;

// "core services" are: Facebook, Flickr, Picasa Web Albums, and YouTube
private class ShotwellPublishingCoreServices : Object, Spit.Module {
    private Spit.Pluggable[] pluggables = new Spit.Pluggable[0];

    public ShotwellPublishingCoreServices() {
        pluggables += new FacebookService();
        pluggables += new PicasaService();
        pluggables += new FlickrService();
        pluggables += new YouTubeService();
    }
    
    public unowned string get_module_name() {
        return _("Core Publishing Services");
    }
    
    public unowned string get_version() {
        return _VERSION;
    }
    
    public unowned string get_id() {
        return "org.yorba.shotwell.publishing.core_services";
    }
    
    public unowned Spit.Pluggable[]? get_pluggables() {
        return pluggables;
    }
}

// This entry point is required for all SPIT modules.
public Spit.Module? spit_entry_point(int host_min_spit_interface, int host_max_spit_interface,
    out int module_spit_interface) {
    module_spit_interface = Spit.negotiate_interfaces(host_min_spit_interface, host_max_spit_interface,
        Spit.CURRENT_INTERFACE);
    if (module_spit_interface == Spit.UNSUPPORTED_INTERFACE)
        return null;
    
    return new ShotwellPublishingCoreServices();
}

// valac wants a default entry point, so valac gets a default entry point
private void dummy_main() {
}

