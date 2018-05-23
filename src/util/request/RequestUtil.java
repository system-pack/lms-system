package util.request;

import java.lang.reflect.Method;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import util.exception.HinaException;
import util.exception.HinaOrmapperException;

public class RequestUtil {

	/**
	 * sqlから所定のインスタンスを取得する
	 *
	 * @param id
	 * @param params
	 * @param clazz
	 * @return
	 * @throws HinaException
	 */
	public <T> T getParameter(String sql, Class<T> clazz, HttpServletRequest request) throws HinaException {

		Enumeration<String> names = request.getParameterNames();

		T target = null;

		try {

			target = clazz.newInstance();

			while (names.hasMoreElements()) {

				String name = names.nextElement();
				Object value = request.getAttribute(name);

				String setterName = "set" + name.substring(0, 1).toUpperCase() + name.substring(1);
				Method[] methods = clazz.getMethods();
				for (Method method : methods) {

					if (method.getName().equals(setterName)) {
						Class<?> parameterClazz = method.getParameterTypes()[0];

						if (parameterClazz == int.class) {
							method.invoke(target, ((Integer) value).intValue());
						} else {
							method.invoke(target, parameterClazz.cast(value));
						}
					}

				}

			}

		} catch (Exception e) {
			throw new HinaOrmapperException("インスタンスへの変換に失敗しました。", e);
		}

		return target;

	}

}
