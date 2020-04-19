if [[ $XDG_CACHE_HOME ]]; then
  done_file=$XDG_CACHE_HOME/xxh-plugin-prerun-dotfiles-done
else
  done_file=$XXH_HOME/.xxh-plugin-prerun-dotfiles-done
fi

if [[ ! -f $done_file ]]; then
  CURR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
  cd $CURR_DIR/home
  for item in $(shopt -s dotglob && cd $CURR_DIR/home && find *); do

    item_basedir=`echo $item | cut -d "/" -f1`
    target_item=$XXH_HOME/$item
    target_dir=`dirname $target_item`
    if [[ $item_basedir == '.config' && $XDG_CONFIG_HOME ]]; then
      target_dir=`dirname $XDG_CONFIG_HOME`
      target_item=$target_dir/$item
    fi

    if [[ -f $item && ! -f $target_item ]]; then
      if [[ $XXH_VERBOSE == '1' || $XXH_VERBOSE == '2' ]]; then
        echo "xxh-plugin-prerun-dotfiles: Create file $target_item"
      fi
      mkdir -p $target_dir
      cp $item $target_item
    elif [[ -d $item && ! -d $target_item ]]; then
      if [[ $XXH_VERBOSE == '1' || $XXH_VERBOSE == '2' ]]; then
        echo "xxh-plugin-prerun-dotfiles: Create dir $target_item"
      fi
      mkdir -p $target_item
    fi
  done
  cd $XXH_HOME
  mkdir -p `dirname $done_file`
  echo 'done' > $done_file
fi
