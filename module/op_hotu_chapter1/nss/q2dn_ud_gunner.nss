//::///////////////////////////////////////////////
//:: Default User Defined Event
//:: FileName:
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:Keith Warner
//:: Created On:Nov 19/02
//:://////////////////////////////////////////////

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {
        if (GetLocalInt(GetModule(), "X2_Q2DNAlarmTriggered") == 2)
        {
            //if they are not attacking a PC
            if (GetLocalInt(OBJECT_SELF, "nAttackPC") == 1)
                return;

            object oBallista = GetObjectByTag("q2dn_ballista" + GetStringRight(GetTag(OBJECT_SELF), 1));
            SetFacingPoint(GetPosition(oBallista));
            PlayAnimation(ANIMATION_LOOPING_GET_MID, 1.0, 2.0);
            DelayCommand(2.0, DoPlaceableObjectAction(oBallista, PLACEABLE_ACTION_USE));
        }
    }



}

