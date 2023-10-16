void main()
{
    int nEvent = GetUserDefinedEventNumber();
    switch(nEvent)
    {
        case 777:
         ClearAllActions();
         ActionMoveToObject(GetNearestObjectByTag("WP_M1S5Respond"),TRUE);
         ActionOpenDoor(GetNearestObjectByTag("M1S5GuardDoor"));
         SetEncounterActive(TRUE,GetNearestObjectByTag("ENC_M1S5Guard"));
         ActionMoveToObject(GetNearestObjectByTag("WP_M1S5Respond",OBJECT_SELF,2),TRUE);
         ActionOpenDoor(GetNearestObjectByTag("M1S5GuardDoor",OBJECT_SELF,2));
         SetEncounterActive(TRUE,GetNearestObjectByTag("ENC_M1S5Guard",OBJECT_SELF,2));

        break;


    }
}
