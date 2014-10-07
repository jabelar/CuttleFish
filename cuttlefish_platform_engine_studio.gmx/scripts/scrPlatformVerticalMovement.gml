// platform_id is updated in calling script
if platform_id > 0 then // on a platform
    {
    y = y + platform_id.vert_speed ;
    // I don't use move contact because it causes trouble with stacked movables
    // just don't make rooms where stacks can be squished.
    // but still can move into characters (so need to check in scrGetUnstuck()
    }
