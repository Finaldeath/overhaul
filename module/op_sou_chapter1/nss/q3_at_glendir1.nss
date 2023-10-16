// glendir should stop following and run to the exit and disappear
// a module variable will need to be set as follows:


void main()
{
    int nAlign = GetAlignmentGoodEvil(GetPCSpeaker());
    if (nAlign == ALIGNMENT_EVIL)
    {
        AdjustAlignment(GetPCSpeaker(), ALIGNMENT_GOOD, 3);
    }
    SetLocalInt(GetModule(), "q3_Glendir_Safe", 1);
    object oWP = GetWaypointByTag("Q3_WP_GLENDIR_EXIT");
    object oGlendir = OBJECT_SELF;
    ActionForceMoveToObject(oWP, TRUE, 10.0);
    DestroyObject(oGlendir, 6.0);
    SetCommandable(FALSE);
}
