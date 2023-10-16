//::///////////////////////////////////////////////
//:: Opening the Sarcophagus
//:: q3ah_open_sarc
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Creates the spectre when you open the sarcophagus
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////
#include "x2_inc_treasure"
#include "nw_o2_coninclude"
#include "x2_inc_compon"

void main()
{
    if(GetLocalInt(OBJECT_SELF,"Q3AH_JUMPING")<1)
    {
        SetLocalInt(OBJECT_SELF, "Q3AH_JUMPING",1);
        object oSarcs = GetObjectByTag("q3ah_plc_invjump");
        int nSarcs = GetLocalInt(oSarcs,"Q3AH_JUMPING");
        nSarcs = nSarcs+1;
        SetLocalInt(oSarcs,"Q3AH_JUMPING",nSarcs);
        object oWay = GetNearestObjectByTag("q3ah_way_jumping");
        location lWay = GetLocation(oWay);
        CreateObject(OBJECT_TYPE_CREATURE,"q3ah_jump_ghost",lWay);
    }
     craft_drop_placeable();

    if (GetLocalInt(OBJECT_SELF,"NW_DO_ONCE") != 0)
    {
       return;
    }
    object oOpener = GetLastOpener();
    DTSGenerateTreasureOnContainer (OBJECT_SELF,oOpener, X2_DTS_CLASS_LOW,X2_DTS_TYPE_DISP | X2_DTS_TYPE_GOLD);
    SetLocalInt(OBJECT_SELF,"NW_DO_ONCE",1);
    ShoutDisturbed();
}
