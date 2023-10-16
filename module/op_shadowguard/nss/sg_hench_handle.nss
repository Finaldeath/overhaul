void main()
{
    object oSelf = OBJECT_SELF;

    if (GetCurrentHitPoints(oSelf) > 1)
    {
        ExecuteScript("nw_ch_ac6", oSelf);
    }
    else
    {
        ExecuteScript("sg_hench_death", oSelf);
    }
}
