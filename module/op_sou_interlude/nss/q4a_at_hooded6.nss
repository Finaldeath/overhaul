// move henchman near behind player

void main()
{
    object oHenchman = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, GetPCSpeaker());
    object oWP = GetWaypointByTag("Q4A_WP_HENCHMAN");
    if(oHenchman != OBJECT_INVALID)
    {
        AssignCommand(oHenchman, ClearAllActions());
        AssignCommand(oHenchman, ActionForceMoveToObject(oWP, FALSE, 0.0, 5.0));
    }
}
