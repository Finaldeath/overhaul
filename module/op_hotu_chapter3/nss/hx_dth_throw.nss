//::///////////////////////////////////////////////
//:: Name hx_dth_throw
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will signal any thrown objects to respawn
     after a certain time.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Aug 20, 2003
//:://////////////////////////////////////////////
void RespawnObject(string sRes, location lLoc);
void main()
{
    location lLoc = GetLocation(OBJECT_SELF);
    string sRes = GetResRef(OBJECT_SELF);

    AssignCommand(GetArea(OBJECT_SELF), RespawnObject(sRes, lLoc));
}

void RespawnObject(string sRes, location lLoc)
{
    ActionWait(60.0);
    CreateObject(OBJECT_TYPE_PLACEABLE, sRes, lLoc);
}
