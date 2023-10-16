//::///////////////////////////////////////////////
//:: Name q2c_stop_divsnd
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    On Exit of the divinity room - stop the sound
    if there are no PCs left in the room...
*/
//:://////////////////////////////////////////////
//:: Created By:    Keith Warner
//:: Created On:    Dec 10/02
//:://////////////////////////////////////////////

void main()
{
    if (GetIsPC(GetExitingObject()))
    {
        object oCreature = GetFirstInPersistentObject();
        int nCount = 0;
        while (oCreature != OBJECT_INVALID)
        {
            if (GetIsPC(oCreature))
                nCount = 1;
            oCreature = GetNextInPersistentObject();
        }
        if (nCount == 0)
        {
            SoundObjectStop(GetObjectByTag("q2c_divinity_sound"));
        }
    }

}
