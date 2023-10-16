void main()
{
    if ( (GetDistanceToObject(GetLastPerceived()) < 20.0) && (GetLocalInt(OBJECT_SELF,"M2Q2TerariDialogue") == 0))
    {
        ActionWait(1.0);
        if ((GetIsPC(GetLastPerceived()) == TRUE) && (GetIsObjectValid(GetLastPerceived())))
            SetLocalInt(OBJECT_SELF,"M2Q2TerariDialogue",1);
            ActionStartConversation(OBJECT_SELF);
    }
}
