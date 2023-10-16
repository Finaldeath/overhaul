void main()
{
    int nNth = 1;
    int bFound = FALSE;
    object oDoor = GetNearestObject(OBJECT_TYPE_DOOR,OBJECT_SELF,nNth);
    while(GetIsObjectValid(oDoor) && bFound == FALSE)
    {
        if(GetPlotFlag(oDoor) == FALSE && GetLocked(oDoor) == FALSE)
        {
            bFound = TRUE;
        }
        else
        {
            nNth++;
            oDoor =GetNearestObject(OBJECT_TYPE_DOOR,OBJECT_SELF,nNth);
        }
    }
    if(bFound)
    {
        ActionForceMoveToObject(oDoor,TRUE);
    }
    ActionDoCommand(DestroyObject(OBJECT_SELF));
    SetCommandable(FALSE);

}
