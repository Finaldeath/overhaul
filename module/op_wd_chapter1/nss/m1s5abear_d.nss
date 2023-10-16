void main()
{
    int nEvent = GetUserDefinedEventNumber();
    switch(nEvent)
    {
        case 900:
        {
         ClearAllActions();
         int nTens = 0;
         int nNth = 1;
         object oWP = GetNearestObjectByTag("WP_M1S5AFlee_" +
                                              IntToString(nTens) +
                                              IntToString(nNth));
         while (GetIsObjectValid(oWP))
         {
            ActionForceMoveToObject(oWP,TRUE);
            nNth++;
            if(nNth > 9)
            {
                nNth = 0;
                nTens++;
            }
            oWP = GetNearestObjectByTag("WP_M1S5AFlee_" +
                                           IntToString(nTens) +
                                           IntToString(nNth));
         }
        }
        break;
        case 910:
        {
         ClearAllActions();
         ActionJumpToObject(GetWaypointByTag("WP_M1S5BAnim"));
//         ActionForceMoveToObject(GetWaypointByTag("WP_M1S5BDestroy"),TRUE,0.5);
        }
        break;
    }
}
