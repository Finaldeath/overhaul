//::///////////////////////////////////////////////
//:: mpatchcutscene
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The host tower cutscene was started.
    OnModuleLoad() will check this variable.
    If it is set to 10 the it means that a
    savegame was loaded in the middle of a cutscene.
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(GetModule(),"NW_PATCH_CUTSCENE",10);
}
