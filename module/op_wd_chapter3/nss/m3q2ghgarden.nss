//  * Tell player they entered a garden
void main()
{
    if (GetLocalInt(OBJECT_SELF, "NW_L_DO_ONCE") == 0)
    {
        AssignCommand(GetEnteringObject(), ActionSpeakStringByStrRef(52967));
        SetLocalInt(OBJECT_SELF, "NW_L_DO_ONCE",1);
    }
}
