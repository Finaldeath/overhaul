void main()
{
    object oShadow = GetNearestObject(OBJECT_TYPE_CREATURE,GetObjectByTag("M2Q2CSHMASTIF"));
    
    if(GetDistanceToObject(oShadow) > 10.0)
        {
         ActionMoveToObject(oShadow);
        }
}
