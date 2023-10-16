//::///////////////////////////////////////////////
//:: Used
//:: m1s4ExitArena
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Exits the PC from the arena and destroys
    challenger.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: October 30, 2001
//:://////////////////////////////////////////////

void main()
{
    int nLevel = GetLocalInt(GetModule(),"NW_G_M1S4ArenaLevel");
    switch (nLevel)
    {
        case 1:
            if (GetLocalInt(GetModule(),"NW_G_M1S4ArenaWinner") == 1)
            {
                CreateItemOnObject("M1S04IBADGELVL01",GetLastUsedBy());
            }
        break;
        case 2:
            if (GetLocalInt(GetModule(),"NW_G_M1S4ArenaWinner") == 1)
            {
                CreateItemOnObject("M1S04IBADGELVL02",GetLastUsedBy());
            }
            else
            {
                CreateItemOnObject("M1S04IBADGELVL01",GetLastUsedBy());
            }
        break;
        case 3:
            if (GetLocalInt(GetModule(),"NW_G_M1S4ArenaWinner") == 1)
            {
                CreateItemOnObject("M1S04IBADGELVL03",GetLastUsedBy());
            }
            else
            {
                CreateItemOnObject("M1S04IBADGELVL02",GetLastUsedBy());
            }
        break;
        case 4:
            if (GetLocalInt(GetModule(),"NW_G_M1S4ArenaWinner") == 1)
            {
                CreateItemOnObject("M1S04IBADGELVL04",GetLastUsedBy());
            }
            else
            {
                CreateItemOnObject("M1S04IBADGELVL03",GetLastUsedBy());
            }
        break;
    }
    DestroyObject(GetObjectByTag("M1S04CHRUSK02"));
    DestroyObject(GetObjectByTag("M1S04CFASHI02"));
    DestroyObject(GetObjectByTag("M1S04CAGAR02"));
    DestroyObject(GetObjectByTag("M1S04CCLAUDUS02"));
    SetLocalInt(GetModule(),"NW_G_M1S4ArenaLevel",0);
    SetLocalInt(GetModule(),"NW_G_M1S4ArenaWinner",0);
    AssignCommand(GetLastUsedBy(),JumpToLocation(GetLocation(GetWaypointByTag("M1S4ARENAEXIT"))));
}
