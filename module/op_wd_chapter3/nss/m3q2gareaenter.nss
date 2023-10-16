//::///////////////////////////////////////////////
//:: Area M3Q2F & M3Q2G: OnAreaEnter
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

#include "M3PLOTINCLUDE"

void main()
{
    // * setup locks once
       if (GetLocalInt(OBJECT_SELF, "M3Q2F_L_LockOnce") == 0)
       {
            SetLocalInt(OBJECT_SELF, "M3Q2F_L_LockOnce", 1);
            SetLocalInt(OBJECT_SELF, "M3Q2FLOCKSREMAINING", 3);

       }
       // * can only spawn golems once, in Area F
       if (GetLocalInt(GetModule(), "M3Q2FGolemSpawn") == 0)
       {
            // * Spawn in Golems (only valid in MapF)
            // * Creates the third, fully immune golem -- if waypoint exists
            CreateGolem(3,0);
            CreateGolem(2,0);
            CreateGolem(1,0);
            SetLocalInt(GetModule(), "M3Q2FGolemSpawn", 1);
       }
    if(GetLocalInt(GetModule(),"NW_G_M3Q2G_AUTOSAVE")==0 && GetIsPC(GetEnteringObject()))
    {
        DoSinglePlayerAutoSave();
        SetLocalInt(GetModule(),"NW_G_M3Q2G_AUTOSAVE",1);
    }
       // sets the area
       SetLocalInt(GetModule(),"NW_G_CREATOR",2);
       SetLocalString(OBJECT_SELF, "NW_GAREA_GONGPUZZLEDESIRED", "43121324");

}
