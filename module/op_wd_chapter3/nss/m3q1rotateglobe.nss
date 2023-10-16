//::///////////////////////////////////////////////
//:: Rotate the Globe
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
   Sets the global - rotating the globe
*/
//:://////////////////////////////////////////////
//:: Created By: Brent
//:: Created On: November 21, 2001
//:://////////////////////////////////////////////


void main()
{
    if (GetLocalInt(GetModule(),"NW_G_M3Q01PLOTGLOBEONPEDESTAL") == 10)
    {
        SetLocalInt(GetModule(),"NW_G_M3Q01PLOTGLOBEONPEDESTAL",1);
        // * Make Dryads Friendly, Dwarves angry
    }
    else if (GetLocalInt(GetModule(),"NW_G_M3Q01PLOTGLOBEONPEDESTAL") == 1)
    {
        SetLocalInt(GetModule(),"NW_G_M3Q01PLOTGLOBEONPEDESTAL",10);
        // * Make Dryads Angry, Dwarves Friendly
    }

}
