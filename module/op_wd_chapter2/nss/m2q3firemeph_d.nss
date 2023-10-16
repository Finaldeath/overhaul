//::///////////////////////////////////////////////
//:: Heartbeat
//:: m2q3FireMeph_D
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Fire mephits will try to use dried hearts in
    the braziers to summon fire elementals.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: December 7, 2001
//:://////////////////////////////////////////////

void main()
{
    int nEvent = GetUserDefinedEventNumber();

    object oShelf = GetNearestObjectByTag("M2Q03PFIRESHELF");
    object oBrazier = GetNearestObjectByTag("M2Q03PFIREBRAZ");
    object oHeart = GetItemPossessedBy(OBJECT_SELF,"M2Q03IDRIEDHEART");
    object oHeart2 = GetItemPossessedBy(oShelf,"M2Q03IDRIEDHEART");

    switch (nEvent)
    {
        case 300:
            if (GetIsObjectValid(oHeart) &&
                GetDistanceToObject(oBrazier) > 3.0)
            {
                ClearAllActions();
                SpeakString("Moving to Brazier");
                ActionMoveToObject(oBrazier);
            }
            else if (GetIsObjectValid(oHeart) &&
                     GetDistanceToObject(oBrazier) <= 3.0)
            {
                ClearAllActions();
                SpeakString("Giving to Brazier");
                ActionGiveItem(oHeart,oBrazier);
            }
            else if (GetIsObjectValid(oHeart2) &&
                     GetDistanceToObject(oShelf) > 3.0)
            {
                ClearAllActions();
                SpeakString("Moving to Shelf");
                ActionMoveToObject(oShelf);
            }
            else if (GetIsObjectValid(oHeart2) &&
                     GetDistanceToObject(oShelf) <= 3.0)
            {
                ClearAllActions();
                SpeakString("Taking from Shelf");
                ActionTakeItem(oHeart2,oShelf);
            }
        break;
    }
    SpeakString("Signal");
    DelayCommand(6.0,SignalEvent(OBJECT_SELF,EventUserDefined(300)));
}
