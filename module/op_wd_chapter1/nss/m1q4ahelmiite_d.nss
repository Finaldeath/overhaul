//returns to post if further than 10m away
void main()
{
    switch(GetUserDefinedEventNumber())
    {
        case 1001:
        {
            object oPost = GetNearestObjectByTag("POST_" + GetTag(OBJECT_SELF));
            if(GetDistanceToObject(oPost) > 10.0)
            {
                ClearAllActions();
                ActionMoveToObject(oPost);
            }
        }
        break;
    }
}
