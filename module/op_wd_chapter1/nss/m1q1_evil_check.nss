//:://////////////////////////////////////////////
/*
    Checks if PC was evil to character
    character reacts negatively and closes off information
*/
//:://////////////////////////////////////////////
//:: Created By: Luke Kristjanson
//:: Created On: Mar 01, 2002
//:://////////////////////////////////////////////
int StartingConditional()
{
    object oEvil = GetLocalObject(OBJECT_SELF,"Evil");
    return GetIsObjectValid(oEvil) &&
           oEvil == GetPCSpeaker();
}
