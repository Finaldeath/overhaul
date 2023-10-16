//::///////////////////////////////////////////////
//:: Name hxa_morph_ext
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will close up the wolf den.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Aug 21, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetExitingObject();
    object oBlock = GetObjectByTag("hx_wolf_block");
    object oStorage = GetObjectByTag("hx_wolf_den_storage");

    if(GetIsPC(oPC))
    {
        if(!GetIsObjectValid(oBlock))
        {
            CreateObject(OBJECT_TYPE_PLACEABLE, "hx_wolf_block", GetLocalLocation(oStorage, "HX_WOLF_BLOCK"));
        }
    }
}
