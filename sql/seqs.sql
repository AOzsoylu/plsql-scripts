select sequence_name, last_number, min_value, max_value, increment_by,
       cycle_flag, order_flag, cache_size
from user_sequences
order by sequence_name
/
