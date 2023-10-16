//Map out the area for PCs
//To go in 'OnEntered' event for the area.

void main()
{

    object oEntered = GetEnteringObject();

    object oArea = GetArea(oEntered);

    if(GetIsPC(oEntered) == TRUE)
    {
        if (GetLocalInt(OBJECT_SELF, "nGateDestroyed") != 1)
        {
            object oGate = GetObjectByTag("q1bhilltopgate");
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(500), oGate);
            SetLocalInt(OBJECT_SELF, "nGateDestroyed", 1);
        }
        if (GetLocalInt(GetModule(), "X1_HilltopKids") != 1)
        {
            if (GetLocalInt(oEntered, "NW_JOURNAL_ENTRYq1gprophet") > 35 && GetLocalInt(oEntered, "NW_JOURNAL_ENTRYq1bfamily") > 30 && GetLocalInt(oEntered, "NW_JOURNAL_ENTRYq1dcook") > 10)
            {
                SetLocalInt(GetModule(), "X1_HilltopKids", 1);
                CreateObject(OBJECT_TYPE_CREATURE, "q1bboy", GetLocation(GetWaypointByTag("wp_hilltop_boy1")));
                CreateObject(OBJECT_TYPE_CREATURE, "q1bboy", GetLocation(GetWaypointByTag("wp_hilltop_boy2")));
                CreateObject(OBJECT_TYPE_CREATURE, "q1bboy", GetLocation(GetWaypointByTag("wp_hilltop_boy3")));
                CreateObject(OBJECT_TYPE_CREATURE, "q1bgirl", GetLocation(GetWaypointByTag("wp_hilltop_girl1")));
            }
        }
        //Do Single player save and explore area
        if (GetLocalInt(oEntered, "X1_" + GetTag(OBJECT_SELF) + "AUTOSAVE") != 1)
        {
            SetLocalInt(oEntered, "X1_" + GetTag(OBJECT_SELF) + "AUTOSAVE", 1);
            ExploreAreaForPlayer(oArea, oEntered);
            DoSinglePlayerAutoSave();

        }
    }



}
